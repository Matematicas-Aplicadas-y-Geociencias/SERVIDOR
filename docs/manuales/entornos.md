<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Entornos virtuales de Python

## Mamba

La información de este manual la puedes encontrar [aquí](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html).

El primer paso consiste en instalar ***Miniforge***. Escoge tu sistema operativo para instalarlo correctamente:

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="windows">
    <p> Verifica si la versión de tu sistema operativo es Windows 10 o superior. Una vez hecho esto, descarga el instalador de miniforge y ejecútalo: <a href="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe"> Miniforge3-Windows-x86_64.exe</a>.
    <br>Sigue las indicaciones de la ventana de instalación, tomando en cuenta la opción de <b>"Create start menu shorcuts"</b> (Crear accesos directos en el menú de inicio). La forma más conveniente y probada de usar el software instalado (como los comandos <b>conda</b> y <b>mamba</b>) es a través del <b>"Miniforge Prompt"</b> instalado en el menú de inicio.
    <br>Si necesitas que conda sea accesible desde cualquier terminal que abras en Windows (Ej. Powershell), puedes considerar la opción <b>"Add Miniforge3 to my PATH environment variable"</b> (Agregar Miniforge a mi variable de entorno PATH). Esta última no está seleccionada por defecto debido a la posibilidad de conflictos graves con otro software.
    </p>
  </div>

  <div role="tabpanel" class="tab-pane" id="linux">
    <p>Instálalo desde la terminal usando tu gestor de paquetes:</p>
    <div class="terminal|-output">
      <pre><span class="path">$</span> sudo apt update
      <span class="path">$</span> sudo apt install nombre-paquete</pre>
    </div>
  </div>
</div>



