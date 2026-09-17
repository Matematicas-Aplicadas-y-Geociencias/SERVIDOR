#!/bin/bash
# Compila WRF (modo dmpar, gfortran) asumiendo que las librerías del paso 5
# (zlib, HDF5, netCDF-C, netCDF-Fortran, MPICH) ya están instaladas.
#
# IMPORTANTE: corre este script en una terminal NUEVA, donde solo esté
# cargado el entorno persistente (wrf_env.sh), sin las variables de
# compilación de librerías (wrf_env_build_libs.sh), ya que esas pueden
# interferir con el configurador de WRF.

# ---------- Configuración editable ----------
dir_WRF="$HOME/wrf_build"

# Números de opción que pidió ./configure la vez pasada.
# Si tu lista de opciones sale distinta, cámbialos aquí antes de correr.
OPCION_PLATAFORMA=34   # GNU (gfortran/gcc) dmpar
OPCION_NESTING=1       # basic

NCPU=$(nproc)

# ---------- Funciones auxiliares ----------

paso() {
    echo ""
    echo "=========================================="
    echo " $1"
    echo "=========================================="
}

verificar() {
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

# ---------- 0. Verificar entorno ----------

paso "0/4 - Verificando entorno"

FALTAN=0
for var in dir NETCDF; do
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
    echo " ERROR: falta cargar el entorno persistente."
    echo " Corre primero (en esta terminal):"
    echo "   source ~/wrf_build/wrf_env.sh"
    echo " y vuelve a ejecutar este script."
    echo "############################################"
    exit 1
fi

if [ -n "$FFLAGS" ] || [ -n "$CPPFLAGS" ]; then
    echo ""
    echo "############################################"
    echo " ADVERTENCIA: detecté variables de compilación de librerías"
    echo " (FFLAGS/CPPFLAGS) activas en esta terminal. Esto puede"
    echo " interferir con el configurador de WRF."
    echo " Recomendación: abre una terminal NUEVA y vuelve a correr"
    echo " este script ahí."
    echo "############################################"
    exit 1
fi

if ! command -v mpif90 &> /dev/null; then
    echo ""
    echo "############################################"
    echo " ERROR: no se encontró 'mpif90' en el PATH."
    echo " Revisa que wrf_env.sh incluya la ruta a mpich/bin"
    echo " y que el paso 5 (librerías) haya terminado bien."
    echo "############################################"
    exit 1
fi
echo "OK -> mpif90 encontrado en: $(command -v mpif90)"

# ---------- 1. Descargar WRF ----------

mkdir -p "$dir_WRF"
cd "$dir_WRF" || { echo "No se pudo entrar a $dir_WRF"; exit 1; }

paso "1/4 - Descargando código fuente de WRF"

if [ -d "$dir_WRF/WRF" ]; then
    echo "La carpeta WRF ya existe, no se vuelve a clonar."
else
    git clone --recurse-submodule https://github.com/wrf-model/WRF.git
    verificar "git clone de WRF" $?
fi
verificar_archivo "$dir_WRF/WRF/configure" "descarga de WRF"

cd "$dir_WRF/WRF" || exit 1

# ---------- 2. Configurar WRF ----------

paso "2/4 - Configurando WRF (plataforma=$OPCION_PLATAFORMA, nesting=$OPCION_NESTING)"

printf "%s\n%s\n" "$OPCION_PLATAFORMA" "$OPCION_NESTING" | ./configure
verificar "./configure de WRF" $?
verificar_archivo "$dir_WRF/WRF/configure.wrf" "configuración de WRF"

# ---------- 3. Compilar WRF ----------

paso "3/4 - Compilando WRF (em_real), usando $NCPU núcleos. Esto puede tardar bastante."

./compile em_real -j "$NCPU" >& log.compile
CODIGO_COMPILE=$?

echo ""
echo "Últimas líneas del log de compilación:"
tail -20 log.compile

verificar "./compile em_real" $CODIGO_COMPILE

# ---------- 4. Verificar ejecutables ----------

paso "4/4 - Verificando ejecutables generados"

TODO_OK=1
for exe in wrf.exe real.exe ndown.exe tc.exe; do
    if [ -f "$dir_WRF/WRF/main/$exe" ]; then
        echo "OK -> main/$exe generado."
    else
        echo "FALTA -> main/$exe NO se generó."
        TODO_OK=0
    fi
done

if ! grep -q "Executables successfully built" log.compile; then
    echo "FALTA -> el log no contiene la línea 'Executables successfully built'."
    TODO_OK=0
fi

if [ "$TODO_OK" -eq 0 ]; then
    echo ""
    echo "############################################"
    echo " ERROR: la compilación de WRF NO terminó correctamente."
    echo " Revisa el archivo completo:"
    echo " $dir_WRF/WRF/log.compile"
    echo "############################################"
    exit 1
fi

echo ""
echo "############################################"
echo " COMPILACIÓN DE WRF COMPLETADA CON ÉXITO"
echo "############################################"
echo ""
echo "Ejecutables disponibles en: $dir_WRF/WRF/main/"
echo "  - wrf.exe"
echo "  - real.exe"
echo "  - ndown.exe"
echo "  - tc.exe"
echo ""
echo "Ya puedes continuar con la compilación de WRF."
