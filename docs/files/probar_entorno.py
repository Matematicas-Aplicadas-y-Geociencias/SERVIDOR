import os
import sys
import platform

os.system("")  # habilita códigos ANSI en CMD de Windows

# Colores ANSI
CYAN = "\033[96m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
BOLD = "\033[1m"
RESET = "\033[0m"

def print_left(text, color=""):
    for line in text.split("\n"):
        print(color + line + RESET)

def obtener_ambiente():
    # Conda
    env = os.environ.get("CONDA_DEFAULT_ENV")
    if env:
        return "entorno " + env + " funciona correctamente"
    # uv / venv / virtualenv (todos usan VIRTUAL_ENV)
    venv_path = os.environ.get("VIRTUAL_ENV")
    if venv_path:
        return os.path.basename(venv_path.rstrip("/\\")) + " entorno UV funciona correctamente"
    return "base / sistema"

banner = r"""
 _   _       _         __  __                 _       _ 
| | | | ___ | | __ _   |  \/  |_   _ _ __   __| | ___ | |
| |_| |/ _ \| |/ _` |  | |\/| | | | | '_ \ / _` |/ _ \| |
|  _  | (_) | | (_| |  | |  | | |_| | | | | (_| | (_) |_|
|_| |_|\___/|_|\__,_|  |_|  |_|\__,_|_| |_|\__,_|\___/(_)
"""

linea = "=" * 60

print_left(linea, CYAN)
print_left(banner, GREEN + BOLD)
print_left(linea, CYAN)
print()
print_left("✓ Instalación de ambiente virtual verificada correctamente", GREEN + BOLD)
print()
print_left(f"Estatus del ambiente: {obtener_ambiente()}", CYAN + BOLD)
print_left(f"Versión de Python: {platform.python_version()}", CYAN + BOLD)
print()
print_left(linea, YELLOW)
print_left("SERVIDOR ENES Mérida, UNAM", YELLOW + BOLD)
print_left(linea, YELLOW)
