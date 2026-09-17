<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Instalación de WRF

## Requisitos previos

Antes de empezar, verifica que tu computadora cumpla con los siguientes requsitos:
<ul>
  <li>Sistema operativo: distribuciones basadas en Debian (Ubuntu, MX Linux, Kali Linux, etc.).</li>
  <li>Memoria RAM: 8 GB como mínimo (ideal 16 GB).</li>
  <li>Almacenamiento: 20 GB libres.</li>
</ul>

¿Tienes todo lo necesario? ¡Excelente! Comencemos entonces. 

## 1. Instalar herramientas de compilación

<p>Estas herramientas son paqueterías del sistema necesarias para compilar WRF/WPS. Son seguras de instalar: no interfieren con nada que ya tengas instalado. </p>

<p>Para instalarlas en un solo paso, descarga el siguiente script (<a href="../../files/verificar_instalar_deps_wrf.sh" download>verificar_instalar_deps_wrf.sh</a>), abre la terminal donde lo hayas guardado, y ejecútalo como sigue:</p>

<pre><code>chmod +x verificar_instalar_deps_wrf.sh
./verificar_instalar_deps_wrf.sh</code></pre>

Te pedirá que escribas tu contraseña del sistema. Descuida: no vamos a robar tus datos. Es una medida de seguridad que tiene tu computadora cuando se actualizan e instalan dependencias. 

<p>Explicación de los comandos: lo que hacemos es darle permisos de ejecución al script con <code>chmod +x</code> y luego lo ejecutamos con <b>./</b> + el nombre del script.</p>

<p>Explicación del script <b>verificar_instalar_deps_wrf.sh</b>: básicamente realiza tres acciones en tres pasos; actualiza las dependencias del sistema, revisas si ya están instaladas las herramientas de compilación del modelo e instala las que hagan falta, y al final te muestra un resumen de lo realizado.</p>

<p>Al finalizar te saldrá algo parecido a lo siguiente (dependiendo de lo que ya tengas o no instalado):</p>

<div class="terminal-output" markdown="0">
<pre>
==========================================
 Paso 3/3: Resumen final
==========================================

Ya estaban instalados:
  - perl
  - git
  - wget
  - curl
  - unzip

Se instalaron:
  - gfortran
  - csh
  - m4
  - tcsh

==========================================
 Versión de gcc
==========================================
gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
Copyright (C) 2023 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


LISTO.Las dependencias necesarias para compilar WRF/WPS están instaladas.</pre>
</div>

<p>También te muestra la versión de la paquetería <b>gcc</b>. Esta versión deber ser  igual o mayor a la versión 9.0. Si te aparece una igual o mayor, ya estás del otro lado.</p>

## 2. Crear la carpeta de instalación del modelo

<p>Para mantener toda la instalación organizada en un sólo lugar, vamos a crear una carpeta llamada <b>wrf_build</b> en la raíz y nos movemos a la carpeta:</p>

<code><pre>
mkdir -p ~/wrf_build
cd ~/wrf_build
</pre></code>

<div class="terminal-output" markdown="0">

<pre>
(base)<span class="user">tu-usuario@tu_dispositivo</span>:<span class="timestamp">~/wrf_build</span>$</pre>
</div>

## 3. Configurar variables de entorno permanentes

<p>Vamos configurar todas las variables de entorno que se deben cargar siempre que se abra la terminal, dado que son necesarias para usar WRF en el día a día. Para ello descarga el siguiente script (<a href="../../files/wrf_env.sh" download>wrf_env.sh</a>) y guárdalo en la carpeta de instalación <b>wrf_build</b>.</p> 

<p>Ahora agregamos una sola línea a tu <b>.bashrc</b> para que este archivo se cargue solo cada vez que abras la terminal:</p>

<pre><code>echo '' >> ~/.bashrc
echo '# >>> entorno WRF/WPS (agregado para compilar/ejecutar WRF) >>>' >> ~/.bashrc
echo 'source ~/wrf_build/wrf_env.sh' >> ~/.bashrc
echo '# <<< fin entorno WRF/WPS <<<' >> ~/.bashrc
source ~/.bashrc</code></pre>

## 4. Configurar variables de entorno temporales

<p>Estas variables <b>no deben estar activas</b> cuando compiles WRF o WPS más adelante (interfieren con su propio sistema de configuración).</p>

<p>Descarga el siguiente script (<a href="../../files/wrf_env_build_libs.sh" download>wrf_env_build_libs.sh</a>), guárdalo en la carpeta <b>wrf_build</b> y ejecuta el siguiente comando: </p>

<pre><code>chmod +x wrf_env_build_libs.sh
./wrf_env_build_libs.sh
source ~/wrf_build/wrf_env_build_libs.sh</code></pre>

Deja esta terminal abierta y sigue en ella para todo el paso 5. Cuando termines de compilar las librerías, <b>abre una terminal nueva</b> para el paso 6 en adelante.

## 5. Compilar las librerías necesarias

Descarga el siguiente script (<a href="../../files/compilar_librerias_wrf.sh" download>compilar_librerias_wrf.sh</a>), guárdalo en la carpeta <b>wrf_build</b> y ejecútalo como sigue:

<pre><code>chmod +x compilar_librerias_wrf.sh
./compilar_librerias_wrf.sh</code></pre>

Explicación del script <b>compilar_librerias_wrf:</b> realiza la descarga y compilación consecutiva de las cinco librerías necesarias (zlib, HDF5, netCDF-C, netCDF-Fortran y MPICH). Este paso puede tardar un poco, así que no te preocupes. Si la compilación es exitosa, verás en la terminal lo siguiente:


<div class="terminal-output" markdown="0">

<pre>
############################################
 COMPILACIÓN DE LIBRERÍAS COMPLETADA CON ÉXITO
############################################"

Se instalaron correctamente:
  - zlib          -> $dir/grib2"
  - HDF5          -> $dir"
  - netCDF-C      -> $NETCDF"
  - netCDF-Fortran-> $NETCDF"
  - MPICH         -> $dir/mpich"

Ya puedes abrir una terminal NUEVA (para que cargue wrf_env.sh limpio,
sin las variables de compilación de este script) y continuar con la
compilación de WRF y WPS.</pre>
</div>

Ahora sí, abre una terminal nueva para continuar con los pasos siguientes.

## 6. Compilación de WRF

Abre una <b>terminal nueva</b> (disculpa que lo repita, pero este paso es fundamental), descarga el siguiente script (<a href="../../files/compilar_wrf.sh" download>compilar_wrf.sh</a>), guárdalo en la carpeta <b>wrf_build</b> y ejecuta lo siguiente:


<pre><code>cd ~/wrf_build/
source ~/wrf_build/wrf_env.sh
chmod +x compilar_wrf.sh
./compilar_wrf.sh</code></pre>


Explicación del script <b>compilar_wrf.sh</b>: lo primero que hace es verificar que las <b>variables de entorno</b> necesarias estén definidas y que no estén activas las variables de compilación de librerías del paso anterior. Posteriomente hace la <b>configuración</b> del WRF automáticamente, enviando las respuesta <b>34</b> referente al compilador <b>GNU (gfortran/gcc)</b> con la etiqueta <b>dmar</b>, y <b>1</b>, referente al  anidamiento <b>basic</b>. Después realiza la compilación como tal y por último verifica si se crearon los 4 ejecutables básicos (<b>wrf.exe</b>, <b>real.exe</b>, <b>ndown.exe</b> y <b>tc.exe</b>). 

Si la compilación fue exitosa, verás en la terminal lo siguiente:


<div class="terminal-output" markdown="0">

<pre>
############################################
 COMPILACIÓN DE WRF COMPLETADA CON ÉXITO
############################################

Ejecutables disponibles en: $dir_WRF/WRF/main/
  - wrf.exe
  - real.exe
  - ndown.exe
  - tc.exe

Ya puedes continuar con la compilación de WRF.</pre>

</div>

¿Te salió el mensaje anterior? ¡Excelente! Sólo falta un paso más.


## 7. Compilación del WPS

Descarga el siguiente script (<a href="../../files/compilar_wps.sh" download>compilar_wps.sh</a>), guárdalo en la carpeta <b>wrf_build</b> y ejecuta lo siguiente:

<pre><code>cd ~/wrf_build/
source ~/wrf_build/wrf_env.sh
chmod +x compilar_wps.sh
./compilar_wps.sh</code></pre>


Explicación del script <b>compilar_wps.sh</b>: además de verificar lo mismo que el script anterior, también verifica que existan <b>wrf.exe</b> y <b>real.exe</b>, osea, que el paso 6 se completó exitosamente. Además, descarga el código fuente de WPS, lo configura y compila. Al final verifica que se hayan creado los 3 ejecutables principales (<b>geogrid.exe</b>, <b>ungrid.exe</b> y <b>metgrid.exe</b>).

<p>Si la compilación fue exitosa, verás en la terminal lo siguiente:</p>

<div class="terminal-output" markdown="0">

<pre>
############################################
 COMPILACIÓN DE WPS COMPLETADA CON ÉXITO
############################################

Ejecutables disponibles en: $dir_WRF/WPS/
  - geogrid.exe
  - ungrib.exe
  - metgrid.exe

Ya puedes continuar con la preparación de datos y la corrida del modelo.</pre>
</div>

¡Felicidades! Haz instalado el WRF por tu cuenta. No es algo menor: es algo que suelen hacer los estudiantes de maestría en sus primeros semestres. Ahora está al alcance de ti, para que le saques el provecho a tus clases y apliques tus conocimientos con fenónemos reales.

<p>Ahora hagamos una prueba de su funcionalidad con un caso de ejemplo sacado directamente de la fuente oficial: una <b>tormenta de nieve</b> ocurrida en Boulder, Colorado, entre el 25 y 27 de noviembre de 2019.  </p>

## Caso ejemplo: simulación de tormenta de nieve



Si deseas conocer más, puedes consultar la fuente oficial <a href="https://www2.mmm.ucar.edu/wrf/site/faq/full_installation.html" target="_blank" rel="noopener noreferrer">aquí</a>.







