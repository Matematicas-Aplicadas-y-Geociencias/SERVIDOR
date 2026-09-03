<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Instalación de WRF

## Requisitos previos

Antes de empezar, verifica que tu computadora cumpla con los siguientes requsitos:
<ul>
  <li>Sistema operativo: distribuciones basada en Debian (Ubuntu, MX Linux, Kali Linux, etc.).</li>
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

<p>Explicación de los comandos: lo que hacemos es darle permisos de ejecución al script con <b>chmod +x</b> y luego lo ejecutamos con <b>./</b> + el nombre del script.</p>

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


Si deseas conocer más, puedes consultar la fuente oficial <a href="https://www2.mmm.ucar.edu/wrf/site/faq/full_installation.html" target="_blank" rel="noopener noreferrer">aquí</a>.



