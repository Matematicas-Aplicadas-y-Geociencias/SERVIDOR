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
    <br>Sigue las indicaciones de la ventana de instalación, tomando en cuenta la opción de <b>"Create shorcuts"</b> (Crear accesos directos) esté seleccionada. Si necesitas que conda sea accesible desde cualquier terminal que abras en Windows (Ej. Powershell), puedes considera seleccionar la opción <b>"Add installation to my PATH environment variable"</b> (Agregar instalación a mi variable de entorno PATH). Esta última no está seleccionada por defecto debido a la posibilidad de conflictos graves con otro software.
    
    <div class="auto-carousel" data-images='[
  {"src": "/images/menu_instalacion_miniforge_1.png", "title": "Paso 1", "desc": "Dale clic en \"Next\"."},
  {"src": "/images/menu_instalacion_miniforge_2.png", "title": "Paso 2", "desc": "Dale clic en <br>\"I agree\"."},
  {"src": "/images/menu_instalacion_miniforge_3.png", "title": "Paso 3", "desc": "Selecciona la opción <br>\"Just Me (recommended)\"."},
  {"src": "/images/menu_instalacion_miniforge_4.png", "title": "Paso 4", "desc": "Dale clic en \"Next\"."},
  {"src": "/images/menu_instalacion_miniforge_5.png", "title": "Paso 5", "desc": "Selecciona la opción \"Add installation to my PATH environment variable\" y dale clic en \"Install\"."},
  {"src": "/images/menu_instalacion_miniforge_6.png", "title": "Paso 6", "desc": "Espera que se complete la instalación y dale clic en \"Next\"."},
  {"src": "/images/menu_instalacion_miniforge_7.png", "title": "Paso 7", "desc": "Dale clic en \"Finish\" para finalizar la instalación."}
]'></div>


    <br> La forma más conveniente y probada de usar el software instalado (como los comandos <b>conda</b> y <b>mamba</b>) es a través del <b>"Miniforge Prompt"</b> instalado en el menú de inicio. Abre la aplicación y escribe <b>conda --version</b> y <b>mamba --version</b>. Si te aparece algo similar a la imagen de abajo, siginifica que se instaló exitosamente.
    <div class="win-terminal">
    <div class="win-titlebar">
    <span class="win-titlebar-text">Miniforge Prompt</span>
    <div class="win-buttons">
      <div class="win-btn">&#8212;</div>
      <div class="win-btn">&#9633;</div>
      <div class="win-btn close">&#10005;</div>
    </div>
    </div>
    <div class="win-body"><span class="win-prompt">(base) C:\Users\Usuario&gt;</span> conda --version
conda 24.9.2
<span class="win-prompt">(base) C:\Users\Usuario&gt;</span> mamba --version
mamba 1.5.8
    </div>
</div>
   
    </p>
  </div>

  <div role="tabpanel" class="tab-pane" id="linux">
    <p>Instálalo desde la terminal usando tu gestor de paquetes:</p>
    <div role="tabpanel" class="tab-pane" id="linux">
  <p>Instrucciones para Linux...</p>

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

</div>
</div>



