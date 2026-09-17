#!/bin/bash
# Compila WPS (modo serial, gfortran, con soporte GRIB2 automático)
# asumiendo que WRF (paso 6) ya está compilado.
#
# IMPORTANTE: corre este script en una terminal NUEVA/normal, con solo
# el entorno persistente (wrf_env.sh) cargado, sin las variables de
# compilación de librerías (wrf_env_build_libs.sh).

# ---------- Configuración editable ----------
dir_WRF="$HOME/wrf_build"

# Número de opción que pidió ./configure la vez pasada (Linux x86_64, gfortran, serial).
# Si tu lista de opciones sale distinta, cámbialo aquí antes de correr.
OPCION_PLATAFORMA=1

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

# ---------- 0. Verificar entorno y que WRF ya esté listo ----------

paso "0/4 - Verificando entorno y que WRF ya esté compilado"

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
    echo " interferir con el configurador de WPS."
    echo " Recomendación: abre una terminal NUEVA y vuelve a correr"
    echo " este script ahí."
    echo "############################################"
    exit 1
fi

for exe in wrf.exe real.exe; do
    verificar_archivo "$dir_WRF/WRF/main/$exe" "compilación previa de WRF (paso 7)"
done

# ---------- 1. Descargar WPS ----------

cd "$dir_WRF" || { echo "No se pudo entrar a $dir_WRF"; exit 1; }

paso "1/4 - Descargando código fuente de WPS"

if [ -d "$dir_WRF/WPS" ]; then
    echo "La carpeta WPS ya existe, no se vuelve a clonar."
else
    git clone https://github.com/wrf-model/WPS.git
    verificar "git clone de WPS" $?
fi
verificar_archivo "$dir_WRF/WPS/configure" "descarga de WPS"

cd "$dir_WRF/WPS" || exit 1

# ---------- 2. Configurar WPS ----------

paso "2/4 - Configurando WPS (plataforma=$OPCION_PLATAFORMA, --build-grib2-libs)"

export WRF_DIR="$dir_WRF/WRF"
echo "WRF_DIR = $WRF_DIR"

printf "%s\n" "$OPCION_PLATAFORMA" | ./configure --build-grib2-libs
verificar "./configure de WPS" $?
verificar_archivo "$dir_WRF/WPS/configure.wps" "configuración de WPS"

# ---------- 3. Compilar WPS ----------

paso "3/4 - Compilando WPS. Esto puede tardar varios minutos."

./compile >& log.compile
CODIGO_COMPILE=$?

echo ""
echo "Últimas líneas del log de compilación:"
tail -20 log.compile

verificar "./compile de WPS" $CODIGO_COMPILE

# ---------- 4. Verificar ejecutables ----------

paso "4/4 - Verificando ejecutables generados"

TODO_OK=1
for exe in geogrid.exe ungrib.exe metgrid.exe; do
    if [ -f "$dir_WRF/WPS/$exe" ]; then
        echo "OK -> $exe generado."
    else
        echo "FALTA -> $exe NO se generó."
        TODO_OK=0
    fi
done

if [ "$TODO_OK" -eq 0 ]; then
    echo ""
    echo "############################################"
    echo " ERROR: la compilación de WPS NO terminó correctamente."
    echo " Revisa el archivo completo:"
    echo " $dir_WRF/WPS/log.compile"
    echo "############################################"
    exit 1
fi

echo ""
echo "############################################"
echo " COMPILACIÓN DE WPS COMPLETADA CON ÉXITO"
echo "############################################"
echo ""
echo "Ejecutables disponibles en: $dir_WRF/WPS/"
echo "  - geogrid.exe"
echo "  - ungrib.exe"
echo "  - metgrid.exe"
echo ""
echo "Ya puedes continuar con la preparación de datos y la corrida del modelo."
