<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Instalación de WRF

## Requisitos previos

Antes de empezar, verifica que tu computadora cumpla con los siguientes requsitos:
<ul>
  <li>Sistema operativo: Linux</li>
  <li>Memoria RAM: 8 GB como mínimo (ideal 16 GB)</li>
  <li>Almacenamiento: 20 GB libres</li>
</ul>

¿Tienes todo lo necesario? ¡Excelente! Comencemos entonces. 

## 1. Instalar herramientas de compilación

<p>Estas herramientas son paqueterías del sistema necesarias para compilar WRF/WPS. Son seguras de instalar: no interfieren con nada que ya tengas instalado. </p>

<p>Para instalarlas en un solo paso, descarga el siguiente script (<a href="../../files/verificar_instalar_deps_wrf.sh" download>verificar_instalar_deps_wrf.sh</a>), abre la terminal donde lo hayas guardado, y ejecútalo como sigue:</p>

<pre><code>chmod +x verificar_instalar_deps_wrf.sh
./verificar_instalar_deps_wrf.sh</code></pre>

Te pedirá que escribas tu contraseña del sistema. Descuida: no vamos a robar tus datos. Es una medida de seguridad que tiene tu computadora cuando se actualizan e instalan dependencias. 

<p>Ahora te explico el código: lo que hacemos es darle permisos de ejecución al script con <b>chmod +x</b> y luego lo ejecutamos con <b>./</b> + el nombre del script.</p>


Si deseas conocer más, puedes consultar la fuente oficial <a href="https://www2.mmm.ucar.edu/wrf/site/faq/full_installation.html" target="_blank" rel="noopener noreferrer">aquí</a>.

