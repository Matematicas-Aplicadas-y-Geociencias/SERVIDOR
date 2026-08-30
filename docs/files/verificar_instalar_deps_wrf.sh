#!/bin/bash
# Verifica e instala las dependencias del sistema necesarias para compilar WRF/WPS.
# Solo instala lo que falte; no reinstala lo que ya está presente.

set -e

PAQUETES=(gfortran csh m4 perl tcsh git wget curl unzip)
INSTALADOS=()
YA_ESTABAN=()

echo "=========================================="
echo " Paso 1/3: Actualizando lista de paquetes"
echo "=========================================="
sudo apt update

echo ""
echo "=========================================="
echo " Paso 2/3: Revisando cada paquete"
echo "=========================================="

for pkg in "${PAQUETES[@]}"; do
    echo ""
    echo "--- Verificando: $pkg ---"
    if dpkg -s "$pkg" &> /dev/null; then
        echo "OK -> '$pkg' ya está instalado."
        YA_ESTABAN+=("$pkg")
    else
        echo "Falta -> instalando '$pkg'..."
        sudo apt install -y "$pkg"
        INSTALADOS+=("$pkg")
        echo "'$pkg' instalado correctamente."
    fi
done

echo ""
echo "=========================================="
echo " Paso 3/3: Resumen final"
echo "=========================================="

if [ ${#YA_ESTABAN[@]} -gt 0 ]; then
    echo ""
    echo "Ya estaban instalados:"
    for p in "${YA_ESTABAN[@]}"; do
        echo "  - $p"
    done
fi

if [ ${#INSTALADOS[@]} -gt 0 ]; then
    echo ""
    echo "Se instalaron:"
    for p in "${INSTALADOS[@]}"; do
        echo "  - $p"
    done
else
    echo ""
    echo "No fue necesario instalar nada nuevo, todo ya estaba presente."
fi

echo ""
echo "=========================================="
echo " Versión de gcc"
echo "=========================================="
gcc --version

echo ""
echo "LISTO.Las dependencias necesarias para compilar WRF/WPS están instaladas."
