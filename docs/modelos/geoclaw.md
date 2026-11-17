<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Introducción

# Instalación de GeoClaw

## Requisitos previos

<p>Antes de empezar, verifica que tu computadora cumpla con los siguientes requisitos:</p>

<ul>
    <li>Sistema operativo: distribuciones basadas en Debian (Ubuntu, Linux Mint, Pop!_OS, etc).</li>
    <li><b>conda</b> instalado (Miniconda, Miniforge, o Anaconda). Compruébalo con <code>conda --version</code>. Si no lo tienes instalado, revisa cómo hacerlo en <a href="../../herramientas_computo/entornos/">Entornos virtuales de Python</a>.</li>
    <li> Alamacenamiento: 5 GB libres.</li>
</ul>

<p>¿Tienes lo necesario? ¡Excelente! Comencemos entonces.</p>

## Paso 1: Instalar herramientas del sistema

<p>Este paso instala con <code>apt</code> las herramientas básicas de compilación y de descarga de código.</p>

<p>Abre la terminal y ejecuta los siguientes comandos:</p>

<pre><code>sudo apt update
sudo apt install -y build-essencial git make</code></pre>

<h4>Qué hace cada comando</h4>

<ul>
    <li><code>sudo</code> ejecuta el comando con permisos de administrador. Te pedirá tu constraseña.</li>
    <li><code>apt update</code> actualiza la lista de paquetes disponibles en Ubuntu. No instala ni actualiza programas: sólo descarga el catálogo para que el siguiente comando instale las versiones vigentes.</li>
    <li><code>apt install -y ...</code> instala los paquetes indicados. La opción <code>-y</code> responde que sí a la confirmación para que no se detenga a preguntar.</li>
</ul>

<h4>Qué aporta cada paquete</h4>

<table border="1">
  <thead>
    <tr>
      <th>Paquete</th>
      <th>Para qué se necesita</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>build-essencial</code></td>
      <td>Compilador de C y C++ (gcc, g++), enlazador y cabeceras estándar. Clawpack compila código al instalarse y al correr cada simulación, esto es la base de ese proceso</td>
    </tr>
    <tr>
      <td><code>git</code></td>
      <td>Clona el código de Clawpack desde GitHub en el paso 4. Para saber cómo funciona Git y Github, ve a <a href="../../herramientas_computo/git_github/">Git y GitHub</a>. </td>
    </tr>
    <tr>
        <td><code>make</code></td>
        <td>Ejecuta los <em>Makefile</em> de cada simulación cuando haces <code>make .output</code> y <code>make .plots</code></td>
    </tr>
  </tbody>
</table>

<p>Si ya tenías estos paquetes, <code>apt</code> lo detecta y no reistalada nada, así que repetir el comando no causa problemas.</p>

## Paso 2. Crear un entorno virtual para Clawpack con Conda

<p>Un entorno de Conda es una carpeta aislada con su propia versión de Python y sus propios paquetes. Así Clawpack no interfiere con otros programas de tu equipo, ni al revés. Para crear el ambiente con los paquetes necesarios ejecuta lo siguiente:</p>

<pre><code>conda create -n clawpack -c conda-forge python=3.12 \
    numpy scipy matplotlib pandas setuptools wheel \
    meson-python ninja gfortran
conda activate clawpack</code></pre>


<h4>Qué hace cada parte del comando</h4>

<ul>
    <li><code>conda create -n clawpack</code> crear un entorno nuevo con el nombre de <b>clawpack</b>.</li>
    <li><code>-c conda-forge</code> indic el canal donde se descargarán los paquetes. Con Miniforge ya es el canal por defecto, pero dejarlo explícito evita sorpresas.</li>
    <li><code>python</code> fija la versión de Python para el entorno.</li>
    <li>Los nombres de los paquetes que se instalan. La barra <code>\</code> sólo permite partir el comando en varias líneas.</li>
    <li><code>conda activate clawpack</code> entra al entorno. Verás <b>(clawpack)</b> al inicio de la línea de tu terminal. Todo lo que instales o ejecutes a partir de aquí usa ese entorno.</li>
</ul>

<h4>Qué aporta cada grupo de paquetes</h4>

<table border="1">
  <thead>
    <tr>
      <th>Paquetes</th>
      <th>Para qué se necesitan</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>numpy</code>, <code>scipy</code>, <code>matplotlib</code></td>
      <td>Cálculo numérico y gráficas</td>
    </tr>
    <tr>
      <td><code>pandas</code></td>
      <td>Lo usa el módulo <b>geoclaw.surge</b> para leer los datos de tormenta</td>
    </tr>
    <tr>
      <td><code>setuptools</code>, <code>wheel</code></td>
      <td>Herramientas de empaquetado. Son necesarias porque el paso 4 usa <code>--no-build-isolation</code></td>
    </tr>
    <tr>
      <td><code>meson-python</code>, <code>ninja</code></td>
      <td>Necesarios para la instalación editable; sin ellos aparece el error <em>No module named 'mesonpy'</em></td>
    </tr>
    <tr>
      <td><code>gfortran</code></td>
      <td>Compilador Fortran. GeoClaw está escrito en Fortan y se compila al instalarse y al correr cada simulación</td>
    </tr>
  </tbody>
</table>

<h4>Verifica que el compilador sea el del entorno</h4>

<p>Ejecuta el siguiente comando:</p>

<pre><code>which gfortran
gfortran --version</code></pre>

<p>La ruta de <code>which gfortran</code> debe estar dentro de la carpeta del entorno (algo como <em>~/miniforge3/envs/clawpack/bin/gfortran</em>), no en <em>usr/bin</em>. Esto importa porque usar el <code>gfortran</code> del sistema puede provocar errores de compilación.</p>

## Paso 3: Instalar Clawpack 5.14.0

<p>Con el entorno <b>clawpack</b> activo, ejecuta:</p>

<pre><code>pip install --src=$HOME/clawpack_src --no-build-isolation -e \
    git+https://github.com/clawpack/clawpack.git@v5.14.0#egg=clawpack</code></pre>

<p>Este comando descarga el código de la versión 5.14.0 desde GitHub y compilar las partes en Fortran, así que puede tardar varios minutos.</p>

<h4>Qué hace cada opción</h4>

<table border="1">
  <thead>
    <tr>
      <th>Parte del comando</th>
      <th>Qué hace</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>pip install</code></td>
      <td>Instala un paquete de Python en el entorno activo.</td>
    </tr>
    <tr>
      <td><code>--scr=$HOME/clawpack_src</code></td>
      <td>Define donde se clona el código fuente (la carpeta <b>clawpack_src</b>). Ahí quedarán <b>geoclaw</b>, <b>pyclaw</b>, <b>clawutil</b> y los demás módulos</td>
    </tr>
    <tr>
        <td><code>--no-build-isolation</code></td>
        <td>Compila usando los paquetes ya instalados en el entorno (<code>numpy</code>, <code>setuptools</code>, <code>meson-python</code>...) en lugar de crear un entorno temporal. Por eso se instalaron antes, en el paso 3</td>
    </tr>
    <tr>
      <td><code>-e</code></td>
      <td>Instalación editable: Python usa directamente el código de <b>clawpack</b> sin copiarlo a otro lugar</td>
    <tr>
    <tr>
      <td><code>git+https://github.com/clawpack/clawpack.git</code></td>
      <td>Indica que el paquete se obtiene clonando el repositorio oficial</td>
    </tr>
    <tr>
      <td><code>@v5.14.0</code></td>
      <td>Fija la versión (la etiqueta <code>v5.14.0</code> del repositorio)</td>
    </tr>
    <tr>
      <td><code>#egg=clawpack</code></td>
      <td>Nombre del paquete que se instala</td>
    </tr>
  </tbody>
</table>

<p>Como la instalación editable, no borres la carpeta <b>clawpack_src</b>: Python la sigue usando.</p>

<h4>Comprueba dónde quedó el código</h4>

<p>Lista el contenido de la carpeta <b>clawpack_src</b> con el comando <code>ls</code>:</p>

<pre><code>ls ~/clawpack_src</code></pre>

<p>Debe aparecer una carpeta llamada <b>clawpack</b>. Accedemos a ella y listamos su contenido:</p>

<pre><code>cd ~/clawpack_src/clawpack/
ls</code></pre>

<p>Aparecerá algo parecido a lo siguiente:</p>


<div class="terminal-output" markdown="0">

<pre>amrclaw      classic             conda-recipe  metadata.py     README.md             setup.py
build        clawpack            geoclaw       pull_all.sh     requirements-dev.txt  visclaw
changes.md   clawutil            LICENSE       pyclaw          riemann
CITATION.md  CODE_OF_CONDUCT.md  meson.build   pyproject.toml  setup.cfg</pre>
</div>

<p>En esta carpeta se encuentras los módulos de <b>Clawpack</b> (como <b>GeoClaw</b>) que podremos usar para modelar diferentes fenómenos. Comprueba que la ruta de la carpeta sea la correcta:</p>

<pre><code>pwd</code></pre>

<p>Si aparece <em>/home/tu-usuario/clawpack_src/clawpack</em>, significa que la carpeta principal está en el lugar adecuado.</p>

<p>Ya sólo nos falta el último paso (pero no menos importante).</p>

## Paso 4: Configurar variables de entorno

<p>Los <b>Makefile</b> de Geoclaw necesitan dos variables para funcionar. Este paso las define y las liga al entorno de Conda.</p>

<table border="1">
  <thead>
    <tr>
      <th>Variable</th>
      <th>Qué indica</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>CLAW</td>
      <td>La ruta de la carpeta que contiene el código de Clawpack. Los <b>Makefile</b> construyen todas sus rutas apartir de ella</td>
    </tr>
    <tr>
      <td>FC</td>
      <td>El compilador Fortran que se debe usar. Aquí va <b>gfortran</b></td>
    </tr>
  </tbody>
</table>

<p>Ejecuta los siguiente comandos:</p>

<pre><code>conda env config vars set CLAW=$HOME/clawpack_src/clawpack FC=gfortran
conda deactivate
conda activate clawpack</code></pre>

<h4>Qué hace cada línea</h4>

<ul>
  <li><code>conda env config vars set ...</code> guarda las variables del entorno <b>clawpack</b>. Sólo existen mientran el entorno está activo y no modifican tu <code>~/.bashrc</code> ni afectan otras terminales.</li>
  <li><code>conda deactivate</code> y <code>conda activate clawpack</code> salen y vuelven a entrar al entorno. Es necesario porque COnda sólo aplica las variable nuevas al activar el entorno.</li>
</ul>

<p>Si de casualidad Conda muestra <em>WARNING: overwriting environment variables set in the machine</em>, no es un error. Significa que <code>CLAW</code> y <code>FC</code> ya existían en tu sistema (por ejemplo, de una instalación anterior) y el entorno las remplaza mientras esté activo. Al hacer <code>conda deactivate</code>, vuelven los valores anteriores.</p>

<h4>Comprueba que se configuraron correctamente</h4>

<p>Ejecuta lo siguiente:</p>

<pre><code>echo $CLAW
echo $FC
ls $CLAW/geoclaw/src/2d/shallow/Makefile.geoclaw</code></pre>

<p>Debe aparecer algo parecido a lo siguiente:</p>

<div class="terminal-output" markdown="0">
<pre>/home/tu-usuario/clawpack_src/clawpack
gfortran
/home/tu-usuario/clawpack_src/clawpack/geoclaw/src/2d/shallow/Makefile.geoclaw
</pre>
</div>

<h4>Qué hace cada línea</h4>

<ul>
    <li><code>echo $CLAW</code> debe mostrar la ruta correcta de la carpeta de Clawpack (<em>/home/tu-usuario/clawpack_src/clawpack</em>).</li>
    <li><code>echo $FC</code> debe mostrar <code>gfortran</code></li>
    <li><code>ls ...Makefile.geoclaw</code> debe listar el archivo sin error. Si dice <em>No such file or directory</em>, <code>CLAW</code> apunta a una ruta equivocada y los <b>Makefile</b> no funcionarán.</li>
</ul>

## Verificar la instalación

<p>Antes de correr una simulación conviene confirmar que Python encuentra Clawpack y que los módulos funcionan (por ejemplo, el módulo de <b>Geoclaw</b>). Ejecuta lo siguiente:</p>

<pre><code>python -c "from clawpack import pyclaw, visclaw; print('PyClaw y VisClaw OK')"
python -c "from clawpack.geoclaw.surge.storm import Storm; print('geoclaw.surge OK')"</code></pre>

<div class="terminal-output" markdown="0">

<pre>PyClaw y VisClaw OK
geoclaw.surge OK
</pre>
</div>

<h4>Qué comprueba cada comando</h4>

<ul>
    <li><code>python-c "..."</code> ejecuta el código de Python que va entre comillas, sin crear un archivo.</li>
    <li>La primera línea importa <code>pyclaw</code> y <code>visclaw</code>. Si imprime <em>Pyclaw y Visclaw OK</em>, Python encuentra Clawpack dentro de tu entorno.</li>
    <li>La segunda línea importa la clase <code>Storm</code> del módulo de marea de tormenta de GeoClaw. Ese módulo usa <b>pandas</b>, así que si imprime <em>geoclaw.surge OK</em>, las dependencias necearias para correr GeoClaw están instaladas.</li>
</ul>














