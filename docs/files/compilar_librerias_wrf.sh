#!/bin/bash
# Compila automáticamente las librerías necesarias para WRF/WPS:
# zlib -> HDF5 -> netCDF-C -> netCDF-Fortran -> MPICH
#
# Verifica el resultado de cada paso antes de continuar. Si algo falla,
# el script se detiene inmediatamente y dice exactamente en qué paso ocurrió.

# ---------- Configuración ----------
# Este script asume que ya sourceaste wrf_env.sh y wrf_env_build_libs.sh
# (o definiste manualmente $dir, $NETCDF, CC, FC, FFLAGS, LDFLAGS, CPPFLAGS, etc.)

NCPU=$(nproc)

echo "=========================================="
echo " Verificando que el entorno ya esté cargado"
echo "=========================================="

FALTAN=0
for var in dir NETCDF CC FC FFLAGS LDFLAGS CPPFLAGS; do
    if [ -z "${!var}" ]; then
        echo "FALTA -> la variable \$$var no está definida."
        FALTAN=1
    else
        echo "OK -> \$$var = ${!var}"
    fi
done

if [ "$FALTAN" -eq 1 ]; then
    echo ""
    echo "############################################"
    echo " ERROR: falta definir variables de entorno."
    echo " Corre primero:"
    echo "   source ~/wrf_build/wrf_env.sh"
    echo "   source ~/wrf_build/wrf_env_build_libs.sh"
    echo " y vuelve a ejecutar este script en la misma terminal."
    echo "############################################"
    exit 1
fi

# ---------- Funciones auxiliares ----------

paso() {
    echo ""
    echo "=========================================="
    echo " $1"
    echo "=========================================="
}

verificar() {
    # $1 = descripción, $2 = código de salida del comando anterior
    if [ "$2" -ne 0 ]; then
        echo ""
        echo "############################################"
        echo " ERROR: falló '$1'"
        echo " Revisa el mensaje de arriba para más detalle."
        echo "############################################"
        exit 1
    else
        echo "OK -> $1 completado sin errores."
    fi
}

verificar_archivo() {
    # $1 = ruta de archivo que debe existir, $2 = descripción
    if [ -f "$1" ] || [ -d "$1" ]; then
        echo "OK -> se encontró: $1"
    else
        echo ""
        echo "############################################"
        echo " ERROR: no se encontró el archivo/carpeta esperado tras $2:"
        echo " $1"
        echo "############################################"
        exit 1
    fi
}

# ---------- Inicio ----------

mkdir -p "$dir"
cd "$dir" || { echo "No se pudo entrar a $dir"; exit 1; }

echo "=========================================="
echo " Compilación automática de librerías WRF/WPS"
echo " Carpeta base: $dir"
echo " Núcleos disponibles: $NCPU"
echo "=========================================="

# ---------- 1. zlib ----------

paso "1/5 - zlib: descargando"
wget -nc https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.11.tar.gz
verificar "descarga de zlib" $?

paso "1/5 - zlib: descomprimiendo"
tar xzvf zlib-1.2.11.tar.gz
verificar "descompresión de zlib" $?

paso "1/5 - zlib: configurando"
cd zlib-1.2.11 || exit 1
./configure --prefix="$dir/grib2"
verificar "configure de zlib" $?

paso "1/5 - zlib: compilando"
make -j "$NCPU"
verificar "make de zlib" $?

paso "1/5 - zlib: instalando"
make install
verificar "make install de zlib" $?
cd "$dir" || exit 1
verificar_archivo "$dir/grib2/lib/libz.a" "instalación de zlib"

echo ""
echo ">>> zlib: LISTO <<<"

# ---------- 2. HDF5 ----------

paso "2/5 - HDF5: descargando"
wget -nc https://github.com/HDFGroup/hdf5/archive/hdf5-1_10_5.tar.gz
verificar "descarga de HDF5" $?

paso "2/5 - HDF5: descomprimiendo"
tar xzvf hdf5-1_10_5.tar.gz
verificar "descompresión de HDF5" $?

CARPETA_HDF5=$(find . -maxdepth 1 -type d -iname "hdf5-hdf5*" | head -n1)
if [ -z "$CARPETA_HDF5" ]; then
    echo "ERROR: no se encontró la carpeta descomprimida de HDF5."
    exit 1
fi

paso "2/5 - HDF5: configurando"
cd "$CARPETA_HDF5" || exit 1
./configure --prefix="$dir" --with-zlib="$dir/grib2" --enable-fortran --enable-shared
verificar "configure de HDF5" $?

paso "2/5 - HDF5: compilando"
make -j "$NCPU"
verificar "make de HDF5" $?

paso "2/5 - HDF5: instalando"
make install
verificar "make install de HDF5" $?
cd "$dir" || exit 1
verificar_archivo "$dir/lib/libhdf5.so" "instalación de HDF5"

echo ""
echo ">>> HDF5: LISTO <<<"

# ---------- 3. netCDF-C ----------

paso "3/5 - netCDF-C: descargando"
wget -nc https://github.com/Unidata/netcdf-c/archive/v4.7.2.tar.gz
verificar "descarga de netCDF-C" $?

paso "3/5 - netCDF-C: descomprimiendo"
tar xzvf v4.7.2.tar.gz
verificar "descompresión de netCDF-C" $?

paso "3/5 - netCDF-C: configurando"
cd netcdf-c-4.7.2 || exit 1
./configure --prefix="$NETCDF" --disable-dap --enable-netcdf4 --enable-shared
verificar "configure de netCDF-C" $?

paso "3/5 - netCDF-C: compilando"
make -j "$NCPU"
verificar "make de netCDF-C" $?

paso "3/5 - netCDF-C: instalando"
make install
verificar "make install de netCDF-C" $?
cd "$dir" || exit 1
verificar_archivo "$NETCDF/bin/nc-config" "instalación de netCDF-C"

echo ""
echo ">>> netCDF-C: LISTO <<<"

# ---------- 4. netCDF-Fortran ----------

export PATH="$NETCDF/bin:$PATH"
export LD_LIBRARY_PATH="$NETCDF/lib:$dir/lib:$dir/grib2/lib:$LD_LIBRARY_PATH"
export LIBS="-lnetcdf -lhdf5_hl -lhdf5 -lz"

paso "4/5 - netCDF-Fortran: descargando"
wget -nc https://github.com/Unidata/netcdf-fortran/archive/v4.5.2.tar.gz
verificar "descarga de netCDF-Fortran" $?

paso "4/5 - netCDF-Fortran: descomprimiendo"
tar xzvf v4.5.2.tar.gz
verificar "descompresión de netCDF-Fortran" $?

paso "4/5 - netCDF-Fortran: configurando"
cd netcdf-fortran-4.5.2 || exit 1
./configure --enable-shared --prefix="$NETCDF"
verificar "configure de netCDF-Fortran" $?

paso "4/5 - netCDF-Fortran: compilando"
make -j "$NCPU"
verificar "make de netCDF-Fortran" $?

paso "4/5 - netCDF-Fortran: instalando"
make install
verificar "make install de netCDF-Fortran" $?
cd "$dir" || exit 1
verificar_archivo "$NETCDF/lib/libnetcdff.so" "instalación de netCDF-Fortran"

echo ""
echo ">>> netCDF-Fortran: LISTO <<<"

# ---------- 5. MPICH ----------

paso "5/5 - MPICH: descargando"
wget -nc https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
verificar "descarga de MPICH" $?

paso "5/5 - MPICH: descomprimiendo"
tar xzvf mpich-3.0.4.tar.gz
verificar "descompresión de MPICH" $?

paso "5/5 - MPICH: configurando"
cd mpich-3.0.4 || exit 1
./configure --prefix="$dir/mpich"
verificar "configure de MPICH" $?

paso "5/5 - MPICH: compilando (esto tarda más, sin -j por estabilidad)"
make
verificar "make de MPICH" $?

paso "5/5 - MPICH: instalando"
make install
verificar "make install de MPICH" $?
cd "$dir" || exit 1
verificar_archivo "$dir/mpich/bin/mpif90" "instalación de MPICH"

echo ""
echo ">>> MPICH: LISTO <<<"

# ---------- Resumen final ----------

echo ""
echo "############################################"
echo " COMPILACIÓN DE LIBRERÍAS COMPLETADA CON ÉXITO"
echo "############################################"
echo ""
echo "Se instalaron correctamente:"
echo "  - zlib          -> $dir/grib2"
echo "  - HDF5          -> $dir"
echo "  - netCDF-C      -> $NETCDF"
echo "  - netCDF-Fortran-> $NETCDF"
echo "  - MPICH         -> $dir/mpich"
echo ""
echo "Ya puedes abrir una terminal NUEVA (para que cargue wrf_env.sh limpio,"
echo "sin las variables de compilación de este script) y continuar con la"
echo "compilación de WRF y WPS."
