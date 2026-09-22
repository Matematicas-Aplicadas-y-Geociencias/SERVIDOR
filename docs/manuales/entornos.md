<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

# Entornos virtuales de Python

## Conda con Mamba

### Instalación a través de Miniforge

Escoge el sistema operativo de tu computadora:

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows1" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux1" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows1">
    
    <p> Verifica si la versión de tu sistema operativo es Windows 10 o superior. Si es así, descarga el instalador de miniforge y ejecútalo: <a href="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe"> Miniforge3-Windows-x86_64.exe</a>.</p>

    <p>Sigue las indicaciones de la ventana de instalación como se muestra a continuación:</p>
    
    <div class="auto-carousel" data-images='[
    {"src": "../../images/menu_instalacion_miniforge_1.png", "title": "Paso 1", "desc": "Dale clic en \"Next\"."},
    {"src": "../../images/menu_instalacion_miniforge_2.png", "title": "Paso 2", "desc": "Dale clic en <br>\"I agree\"."},
    {"src": "../../images/menu_instalacion_miniforge_3.png", "title": "Paso 3", "desc": "Selecciona la opción <br>\"Just Me (recommended)\"."},
    {"src": "../../images/menu_instalacion_miniforge_4.png", "title": "Paso 4", "desc": "Dale clic en \"Next\"."},
    {"src": "../../images/menu_instalacion_miniforge_5.png", "title": "Paso 5", "desc": "Selecciona la opción \"Add installation to my PATH environment variable\" y dale clic en \"Install\"."},
    {"src": "../../images/menu_instalacion_miniforge_6.png", "title": "Paso 6", "desc": "Espera que se complete la instalación y dale clic en \"Next\"."},
    {"src": "../../images/menu_instalacion_miniforge_7.png", "title": "Paso 7", "desc": "Dale clic en \"Finish\" para finalizar la instalación."}
    ]'>
    </div>

    <p>Para verificar que la instalación se realizó exitosamente, abre la aplicación <b>Miniforge Prompt</b> desde el menú de inicio y ejecuta lo siguiente:</p>

    <pre><code>conda --version && mamba --version</code></pre>

    <p>Si te aparece algo similar a la imagen de abajo, siginifica que se instaló exitosamente.</p>

    <div class="miniforge-output">
    <pre>
conda 26.3.2
2.5.0</pre>
    </div>
  </div>

  <!-- SECCION LINUX -->
  
  <div role="tabpanel" class="tab-pane" id="linux1">
  
    <p>Desde una ventana de terminal, descarga el instalador apropiado para la arquitectura de tu computadora usando los comandos <b>curl</b> o <b>wget</b> o tu programa favorito.</p>
  
    <p>Por ejemplo:</p>

    <pre><code>wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh</code></pre>

    <p>Luego corre el script con:</p>

    <pre><code>bash Miniforge3-$(uname)-$(uname -m).sh</code></pre>
  
    <p>Aparecerá en la terminal lo siguiente:</p>
  
    <div class="terminal-output" markdown="0">
    <pre>
Welcome to Miniforge3 26.3.2-3

In order to continue the installation process, please review the license agreement.
Please, press ENTER to continue
>>></pre>
    </div>

  Presiona la tecla ENTER. Aparecerán los términos de licencia. Échale un ojo a los términos avanzando en el texto con la tecla ENTER (o ve hasta el final con la tecla de flecha hacia abajo). Al final aparecerá lo siguiente:

    <div class="terminal-output" markdown="0">

    <pre>
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


Do you accept the license terms? [yes|no]
>>  </pre>
    </div>

    Para continuar, acepta los términos y condiciones escribiendo <b>yes</b> y presionando ENTER (o escribe <b>no</b> si no estás de acuerdo y nos vemos otro día en otro tutorial). 

    <div class="terminal-output" markdown="0">
    <pre>
Miniforge3 will now be installed into this location:
/home/tu-nombre-de-usuario/miniforge3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/tu-nombre-de-usuario/miniforge3] >>></pre>
    </div>

    Por lo general el programa se instala dentro de tu cuenta personal. Te recomendamos dejarlo ahí de modo que la instalación se realice sólo en tu cuenta (evitando que se instale en otras cuentas dentro de tu dispositivo). Presiona ENTER para confirmar dicha ubicación.  


    <div class="terminal-output" markdown="0">
    <pre>
Transaction finished

installation finished.
Do you wish to update your shell profile to automatically initialize conda?
This will activate conda on startup and change the command prompt when activated.
If you'd prefer that conda's base environment not be activated on startup,
   run the following command when conda is activated:

conda config --set auto_activate_base false

Note: You can undo this later by running `conda init --reverse $SHELL`

Proceed with initialization? [yes|no]
[no] >>></pre>
    </div>

    El programa te preguntará si quieres activar conda y el ambiente <b>base</b> automáticamente al abrir una terminal (más adelante te explicaremos para qué sirve dicho ambiente). Le decimos que sí escribiendo <b>yes</b> y presionando ENTER.

    <div class="terminal-output" markdown="0">

    <pre>
==> For changes to take effect, close and re-open your current shell. <==

Running `shell init`, which:
 - modifies RC file: "/home/angel/.bashrc"
 - generates config for root prefix: "/home/angel/miniforge3"
 - sets mamba executable to: "/home/angel/miniforge3/bin/mamba"
The following has been added in your "/home/angel/.bashrc" file

# >>> mamba initialize >>>                                            
# !! Contents within this block are managed by 'mamba shell init' !!  
export MAMBA_EXE='/home/angel/miniforge3/bin/mamba';                  
export MAMBA_ROOT_PREFIX='/home/angel/miniforge3';                    
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"                                     
if [ $? -eq 0 ]; then                                                 
    eval "$__mamba_setup"                                             
else                                                                  
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate  
fi                                                                    
unset __mamba_setup                                                   
# <<< mamba initialize <<<                                            
                                                                      
Thank you for installing Miniforge3!</pre>
    </div>

    Para finalizar la instalación, cierra y abre de nuevo la terminal actual. Aparecerá <b>(base)</b> al inicio de la línea de comandos. 


    <div class="terminal-output" markdown="0">

    <pre>
(base) <span class="user">tu-usuario@tu-dispotivo</span>:<span class="timestamp">~</span>$</pre>
    </div>

    <p>La regla de oro es no instalar nada dentro del ambiente <b>(base)</b>, sino crear un ambiente destinado para la tarea que quieras realizar (más adelante te explicamos cómo crearlo).</p>

    <p>Verifica que se haya instalado correctamente ejecutando en la terminal lo siguiente:</p>

    <pre><code>conda --version && mamba --version</code></pre> 

    Si aparece algo similar a la imagen de abajo, significa que se instaló correctamente.

    <div class="terminal-output" markdown="0">
    <pre>
conda 26.3.2
2.5.0</pre>
    </div>
  
  </div>
</div>

### Creación del ambiente virtual con Conda

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_creacion" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_creacion" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


 <!-- SECCION WINDOWS-->

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows_creacion">
  
  <p>Abre el miniforge y ejecuta lo siguiente, cambiando <b>myenv</b> por el nombre que prefieras para tu ambiente:</p>

  <pre><code>conda create -n myenv python=3.10</code></pre>

  <p>Explicación: <b>conda</b> es el gestor de paquetes, <b>create</b> indica la creación del ambiente, <b>-n</b> le asigna un nombre al entorno, <b>myenv</b> es el nombre como tal (lo puedes cambiar al que prefieras) y <b>python=3.10</b> es la versión de  python que se usará dentro del entorno.</p>

  <div class="miniforge-output">

  <pre>The following NEW packages will be INSTALLED:

  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-20_gnu 
  bzip2              conda-forge/linux-64::bzip2-1.0.8-hda65f42_10 
  ca-certificates    conda-forge/noarch::ca-certificates-2026.7.22-hbd8a1cb_0 
  icu                conda-forge/linux-64::icu-78.3-py310h44b86e0_2 
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.46.1-default_hbd61a6d_102 
  libexpat           conda-forge/linux-64::libexpat-2.8.1-hecca717_1 
  libffi             conda-forge/linux-64::libffi-3.7.0-h3435931_0 
  libgcc             conda-forge/linux-64::libgcc-16.1.0-ha9f2e26_1 
  libgomp            conda-forge/linux-64::libgomp-16.1.0-he0feb66_1 
  liblzma            conda-forge/linux-64::liblzma-5.8.3-hb03c661_1 
  libnsl             conda-forge/linux-64::libnsl-2.0.1-hb9d3cd8_1 
  libsqlite          conda-forge/linux-64::libsqlite-3.53.4-h13e7031_1 
  libstdcxx          conda-forge/linux-64::libstdcxx-16.1.0-h934c35e_1 
  libuuid            conda-forge/linux-64::libuuid-2.42.2-h5347b49_0 
  libxcrypt          conda-forge/linux-64::libxcrypt-4.4.38-h280c20c_0 
  libzlib            conda-forge/linux-64::libzlib-1.3.2-h25fd6f3_3 
  ncurses            conda-forge/linux-64::ncurses-6.6-hdb14827_1 
  openssl            conda-forge/linux-64::openssl-3.6.3-h35e630c_1 
  packaging          conda-forge/noarch::packaging-26.3-pyhc364b38_0 
  pip                conda-forge/noarch::pip-26.2.1-pyh8b19718_0 
  python             conda-forge/linux-64::python-3.10.20-h267e890_1_cpython 
  readline           conda-forge/linux-64::readline-8.3-hd6e31c0_1 
  setuptools         conda-forge/noarch::setuptools-84.0.0-pyh332efcf_0 
  tk                 conda-forge/linux-64::tk-8.6.13-noxft_hd70dff1_3 
  tzdata             conda-forge/noarch::tzdata-2026c-h151e31d_0 
  wheel              conda-forge/noarch::wheel-0.48.0-pyhd8ed1ab_0 
  zstd               conda-forge/linux-64::zstd-1.5.7-hb78ec9c_7 


Proceed ([y]/n)?</pre>
</div>

  <p>El sistema descargará los paquetes y te preguntará si deseas instalarlos. Escribe <b>y</b> y presiona ENTER.</p> Aparecerá lo siguiente:

  <div class="miniforge-output">

<pre>
Downloading and Extracting Packages:

Preparing transaction: done                                                          
Verifying transaction: done                                                          
Executing transaction: done                                                          
#                                                                                    
# To activate this environment, use                                                  
#                                                                                    
#     $ conda activate myenv                                                         
#                                                                                    
# To deactivate an active environment, use                                           
#                                                                                    
#     $ conda deactivate 
</pre>
</div>

<p>Listo! Haz creado un ambiente con conda.</p>


  </div>


 <!-- SECCION LINUX -->
  
  <div role="tabpanel" class="tab-pane" id="linux_creacion">

    <p>Abre una terminal y ejecuta lo siguiente, cambiando <b>myenv</b> por el nombre que prefieras para tu ambiente:</p>

  <pre><code>conda create -n myenv python=3.10</code></pre>

  <p>Explicación: <b>conda</b> es el gestor de paquetes, <b>create</b> indica la creación del ambiente, <b>-n</b> le asigna un nombre al entorno, <b>myenv</b> es el nombre como tal (lo puedes cambiar al que prefieras) y <b>python=3.10</b> es la versión de  python que se usará dentro del entorno.</p>

  <div class="terminal-output" markdown="0">

  <pre>The following NEW packages will be INSTALLED:

  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-20_gnu 
  bzip2              conda-forge/linux-64::bzip2-1.0.8-hda65f42_10 
  ca-certificates    conda-forge/noarch::ca-certificates-2026.7.22-hbd8a1cb_0 
  icu                conda-forge/linux-64::icu-78.3-py310h44b86e0_2 
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.46.1-default_hbd61a6d_102 
  libexpat           conda-forge/linux-64::libexpat-2.8.1-hecca717_1 
  libffi             conda-forge/linux-64::libffi-3.7.0-h3435931_0 
  libgcc             conda-forge/linux-64::libgcc-16.1.0-ha9f2e26_1 
  libgomp            conda-forge/linux-64::libgomp-16.1.0-he0feb66_1 
  liblzma            conda-forge/linux-64::liblzma-5.8.3-hb03c661_1 
  libnsl             conda-forge/linux-64::libnsl-2.0.1-hb9d3cd8_1 
  libsqlite          conda-forge/linux-64::libsqlite-3.53.4-h13e7031_1 
  libstdcxx          conda-forge/linux-64::libstdcxx-16.1.0-h934c35e_1 
  libuuid            conda-forge/linux-64::libuuid-2.42.2-h5347b49_0 
  libxcrypt          conda-forge/linux-64::libxcrypt-4.4.38-h280c20c_0 
  libzlib            conda-forge/linux-64::libzlib-1.3.2-h25fd6f3_3 
  ncurses            conda-forge/linux-64::ncurses-6.6-hdb14827_1 
  openssl            conda-forge/linux-64::openssl-3.6.3-h35e630c_1 
  packaging          conda-forge/noarch::packaging-26.3-pyhc364b38_0 
  pip                conda-forge/noarch::pip-26.2.1-pyh8b19718_0 
  python             conda-forge/linux-64::python-3.10.20-h267e890_1_cpython 
  readline           conda-forge/linux-64::readline-8.3-hd6e31c0_1 
  setuptools         conda-forge/noarch::setuptools-84.0.0-pyh332efcf_0 
  tk                 conda-forge/linux-64::tk-8.6.13-noxft_hd70dff1_3 
  tzdata             conda-forge/noarch::tzdata-2026c-h151e31d_0 
  wheel              conda-forge/noarch::wheel-0.48.0-pyhd8ed1ab_0 
  zstd               conda-forge/linux-64::zstd-1.5.7-hb78ec9c_7 


Proceed ([y]/n)?</pre>
</div>

  <p>El sistema descargará los paquetes y te preguntará si deseas instalarlos. Escribe <b>y</b> y presiona ENTER.</p> Aparecerá lo siguiente:

  <div class="terminal-output" markdown="0">

<pre>
Downloading and Extracting Packages:

Preparing transaction: done                                                          
Verifying transaction: done                                                          
Executing transaction: done                                                          
#                                                                                    
# To activate this environment, use                                                  
#                                                                                    
#     $ conda activate myenv                                                         
#                                                                                    
# To deactivate an active environment, use                                           
#                                                                                    
#     $ conda deactivate 
</pre>
</div>

<p>Listo! Haz creado un ambiente con conda.</p> 
  </div>

</div>


### Activación de ambiente con Conda

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_activacion" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_activacion" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


<div class="tab-content">

 <!-- SECCION WINDOWS-->

  <div role="tabpanel" class="tab-pane active" id="windows_activacion">
    
  Utiliza el siguiente comando, cambiando <b>myenv</b> por el nombre de tu ambiente:

  <pre><code>conda activate myenv</code></pre>

  <div class="miniforge-output">

  <pre>
(myenv) <span class="user">tu-usuario@tu-dispotivo</span>:<span class="timestamp">~</span>$</pre>
    </div>


<p>Notarás que cambió el nombre base por el nombre de tu ambiente. Eso significa que la activación se realizó exitosamente y que te encuentras dentro del ambiente. Una vez activado un ambiente, puedes cambiar a otro usando este mismo comando.</p>

<p><b>OJO:</b> Si abres otra terminal o ventana, te aparecerá el ambiente base por defecto, dado que el ambiente sólo se activa en la terminal o ventana donde la activaste. Si quieres usar el ambiente en la nueva ventana, debes activarlo de nuevo.</p>   


<p>Si deseas desactivar el ambiente y regresar al ambiente base utiliza el comando <b>deactivate</b>:</p>

<pre><code>conda deactivate</code></pre>
  </div>  


 <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_activacion">
  
  Utiliza el siguiente comando, cambiando <b>myenv</b> por el nombre de tu ambiente:

<pre><code>conda activate myenv</code></pre>

<div class="terminal-output" markdown="0">

    <pre>
(myenv) <span class="user">tu-usuario@tu-dispotivo</span>:<span class="timestamp">~</span>$</pre>
    </div>


<p>Notarás que cambió el nombre base por el nombre de tu ambiente. Eso significa que la activación se realizó exitosamente y que te encuentras dentro del ambiente. Una vez activado un ambiente, puedes cambiar a otro usando este mismo comando.</p>

<p><b>OJO:</b> Si abres otra terminal o ventana, te aparecerá el ambiente base por defecto, dado que el ambiente sólo se activa en la terminal o ventana donde la activaste. Si quieres usar el ambiente en la nueva ventana, debes activarlo de nuevo.</p>   


<p>Si deseas desactivar el ambiente y regresar al ambiente base utiliza el comando <b>deactivate</b>:</p>

<pre><code>conda deactivate</code></pre>
  </div>

</div>



### Lista de ambientes

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_lista" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_lista" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


 <!-- SECCION WINDOWS-->

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows_lista">
  
Un comando útil es el que te indica cuáles ambientes has creado en tu dispositivo (por si olvidas el nombre de tu ambiente):

<pre><code>conda env list</code></pre>

<div class="miniforge-output">

<pre>
# conda environments:
#
# * -> active
# + -> frozen
base                *   /home/tu-usuario/miniforge3
myenv                   /home/tu-usuario/miniforge3/env/myenv
</pre>
</div>

Aparecerán la lista de ambientes en el lado izquierdo. El <b>asterisco</b> indica en cuál ambiente te encuentras. En mi caso, estoy en el ambiente <b>base</b>.

  </div>


 <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_lista">
 Un comando útil es el que te indica cuáles ambientes has creado en tu dispositivo (por si olvidas el nombre de tu ambiente):

<pre><code>conda env list</code></pre>

<div class="terminal-output" markdown="0">

<pre>
# conda environments:
#
# * -> active
# + -> frozen
base                *   /home/tu-usuario/miniforge3
myenv                   /home/tu-usuario/miniforge3/env/myenv
</pre>
</div>

Aparecerán la lista de ambientes en el lado izquierdo. El <b>asterisco</b> indica en cuál ambiente te encuentras. En mi caso, estoy en el ambiente <b>base</b>. 
  </div>

</div>

### ¡Prueba Conda!

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_prueba_conda" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_prueba_conda" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


<div class="tab-content">

  <!-- SECCION WINDOWS-->

  <div role="tabpanel" class="tab-pane active" id="windows_prueba_conda">
  
    Descarga el siguiente script de Python: <a href="../../files/probar_entorno.py" download>probar_entorno.py</a>.

    Activa el ambiente que creaste y corre el script <b>probar_entorno.py</b> dentro de la carpeta donde lo guardaste con el siguiente comando:

    <pre><code>python probar_entorno.py</code></pre>

    El script verifica si ambiente en el que te encuentras funciona correctamente. Si te aparece algo parecido a lo siguiente, ¡felicidades!, acabas de correr tu primer código en python con el ambiente que recién creaste a través de Conda.</p>

    <div class="powershell-output">

    <pre>
============================================================

 _   _       _         __  __                 _       _ 
| | | | ___ | | __ _   |  \/  |_   _ _ __   __| | ___ | |
| |_| |/ _ \| |/ _` |  | |\/| | | | | '_ \ / _` |/ _ \| |
|  _  | (_) | | (_| |  | |  | | |_| | | | | (_| | (_) |_|
|_| |_|\___/|_|\__,_|  |_|  |_|\__,_|_| |_|\__,_|\___/(_)

============================================================

✓ Instalación de ambiente virtual verificada correctamente

Estatus del ambiente: entorno myenv funciona correctamente
Versión de Python: 3.10.20</pre>
    </div>
  </div>


  <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_prueba_conda">
  
   Descarga el siguiente script de Python: <a href="../../files/probar_entorno.py" download>probar_entorno.py</a>.

    Activa el ambiente que creaste y corre el script <b>probar_entorno.py</b> dentro de la carpeta donde lo guardaste con el siguiente comando:

    <pre><code>python probar_entorno.py</code></pre>

    El script verifica si ambiente en el que te encuentras funciona correctamente. Si te aparece algo parecido a lo siguiente, ¡felicidades!, acabas de correr tu primer código en python con el ambiente que recién creaste a través de Conda.</p>

    <div class="terminal-output" markdown="0">

    <pre>
============================================================

 _   _       _         __  __                 _       _ 
| | | | ___ | | __ _   |  \/  |_   _ _ __   __| | ___ | |
| |_| |/ _ \| |/ _` |  | |\/| | | | | '_ \ / _` |/ _ \| |
|  _  | (_) | | (_| |  | |  | | |_| | | | | (_| | (_) |_|
|_| |_|\___/|_|\__,_|  |_|  |_|\__,_|_| |_|\__,_|\___/(_)

============================================================

✓ Instalación de ambiente virtual verificada correctamente

Estatus del ambiente: entorno myenv funciona correctamente
Versión de Python: 3.10.20</pre>
    </div>
  </div>

</div>

## UV

### Instalación 

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows2" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux2" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>

<div class="tab-content">

  <!--SECCION WINDOWS-->
  
  <div role="tabpanel" class="tab-pane active" id="windows2">
    
    <p>Desde inicio, abre la aplicación <b>Powershell</b> desde el menú de inicio y ejecuta lo siguiente:</p>

    <pre><code>powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"</code></pre>

  <p>El sistema descargará e instala UV:</p>
  
    <div class="powershell-output">

  <pre>downloading uv 0.12.5 (x86_64-pc-windows-msvc)                                                               
installing to C:\Users\tu-usuario\.local\bin                                                                                  
  uv.exe                                                                                                                  
  uvx.exe                                                                                                                 
  uvw.exe
everything's installed!    

To add C:\Users\tu-usuario\.local\bin to your PATH, either restart your shell or run:

  set Path=C:\Users\tu-usuario\.local\bin;%Path%   (cmd)                                                                       
  $env:Path = "C:\Users\tu-usuario\.local\bin;$env:Path"   (powershell)</pre>
    </div>

  <p>Cierra y abre el powershell para finalizar la instalación.</p>

  </div>

  
  <!--SECCION LINUX-->

  <div role="tabpanel" class="tab-pane" id="linux2">

    <p>Abre una terminal y ejecuta lo siguiente:</p>
    
    <pre><code>curl -LsSf https://astral.sh/uv/install.sh | sh</code></pre>
    
    <p>El sistema descargará e instalará UV:</p>
    
    <div class="terminal-output" markdown="0">

    <pre>
downloading uv 0.12.5 x86_64-unknown-linux-gnu
installing to /home/angel/.local/share/../bin
  uv
  uvx
everything's installed!

To add $HOME/.local/share/../bin to your PATH, either restart your shell or run:

    source $HOME/.local/share/../bin/env (sh, bash, zsh)
    source $HOME/.local/share/../bin/env.fish (fish)
    </pre>
    </div>
    
    Cierra y abre la terminal para finalizar la instalación.
  
  </div>

</div>

### Creación de ambiente virtual con UV

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_creacion_uv" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_creacion_uv" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


 <!-- SECCION WINDOWS-->

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows_creacion_uv">
  
  Abre el PowerShell y ejecuta lo siguiente, cambiando <b>myenv</b> por el nombre que prefieras para tu ambiente:

<pre><code>uv init myenv --python=3.10</code></pre>

Se creará una <b>carpeta</b> llamada como tu ambiente (en este caso, myenv). Cambia a dicha carpeta con el comando <b>cd</b> y el nombre de tu ambiente. Ahí dentro ejecuta los siguiente:

<pre><code>uv sync</code></pre>

<p>El comando <b>sync</b> crea y actualiza el ambiente, descargando las dependencias especificadas en el archivo <b>pyproyect.toml</b>. Es nuestro caso sólo descargará el lenguaje python que especificamos en el paso anterior.</p>

<div class="powershell-output">

<pre>Ussing CPython 3.10.21 
Creating virtual environment at: .venv 
Resolved 1 package in 188ms 
      Built myenv @ file:///C:/Users/tu-usuario/myenv              
Prepared 1 package in 290ms
Installed 1 package in 346ms 
 + myenv==0.1.0 (from file:///C:/Users/tu-usuario/myenv)</pre>

</div>

¡Listo! Haz creado un ambiente con UV.
  </div>


 <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_creacion_uv">
  
  Abre una terminal y ejecuta lo siguiente, cambiando <b>myenv</b> por el nombre que prefieras para tu ambiente:

  <pre><code>uv init myenv --python=3.10</code></pre>

  Se creará una <b>carpeta</b> llamada como tu ambiente (en este caso, myenv). Cambia a dicha carpeta con el comando <b>cd</b> y el nombre de tu ambiente. Ahí dentro ejecuta los siguiente:

  <pre><code>uv sync</code></pre>

  <p>El comando <b>sync</b> crea y actualiza el ambiente, descargando las dependencias especificadas en el archivo <b>pyproyect.toml</b>. Es nuestro caso sólo descargará el lenguaje python que especificamos en el paso anterior.</p>

  <div class="terminal-output" markdown="0">

<pre>Ussing CPython 3.10.21 
Creating virtual environment at: .venv 
Resolved 1 package in 188ms 
      Built myenv @ file:///C:/Users/tu-usuario/myenv              
Prepared 1 package in 290ms
Installed 1 package in 346ms 
 + myenv==0.1.0 (from file:///C:/Users/tu-usuario/myenv)</pre>

</div>

  ¡Listo! Haz creado un ambiente con UV.

  </div>

</div>


### ¡Prueba UV!


<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_prueba_uv" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_prueba_uv" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


<div class="tab-content">

  <!-- SECCION WINDOWS-->

  <div role="tabpanel" class="tab-pane active" id="windows_prueba_uv">
  
    Descarga el siguiente script de Python (<a href="../../files/probar_entorno.py" download>probar_entorno.py</a>) y guárdalo dentro de la carpeta con el nombre de tu ambiente. Muévete a dicha carpeta y corre el script con el siguiente comando:

    <pre><code>uv run probar_entorno.py</code></pre>

    El script verifica si ambiente en el que te encuentras funciona correctamente. Si te aparece algo parecido a lo siguiente, ¡felicidades!, acabas de correr tu primer código en python con el ambiente que recién creaste a través de Conda.</p>

    <div class="powershell-output">

    <pre>
============================================================

 _   _       _         __  __                 _       _ 
| | | | ___ | | __ _   |  \/  |_   _ _ __   __| | ___ | |
| |_| |/ _ \| |/ _` |  | |\/| | | | | '_ \ / _` |/ _ \| |
|  _  | (_) | | (_| |  | |  | | |_| | | | | (_| | (_) |_|
|_| |_|\___/|_|\__,_|  |_|  |_|\__,_|_| |_|\__,_|\___/(_)

============================================================

✓ Instalación de ambiente virtual verificada correctamente

Estatus del ambiente: entorno myenv funciona correctamente
Versión de Python: 3.10.20</pre>
    </div>
  </div>


  <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_prueba_uv">
  
    Descarga el siguiente script de Python (<a href="../../files/probar_entorno.py" download>probar_entorno.py</a>) y guárdalo dentro de la carpeta con el nombre de tu ambiente. Muévete a dicha carpeta y corre el script con el siguiente comando:

    <pre><code>uv run probar_entorno.py</code></pre>

    El script verifica si ambiente en el que te encuentras funciona correctamente. Si te aparece algo parecido a lo siguiente, ¡felicidades!, acabas de correr tu primer código en python con el ambiente que recién creaste a través de Conda.</p>

    <div class="terminal-output" markdown="0">

    <pre>
============================================================

 _   _       _         __  __                 _       _ 
| | | | ___ | | __ _   |  \/  |_   _ _ __   __| | ___ | |
| |_| |/ _ \| |/ _` |  | |\/| | | | | '_ \ / _` |/ _ \| |
|  _  | (_) | | (_| |  | |  | | |_| | | | | (_| | (_) |_|
|_| |_|\___/|_|\__,_|  |_|  |_|\__,_|_| |_|\__,_|\___/(_)

============================================================

✓ Instalación de ambiente virtual verificada correctamente

Estatus del ambiente: entorno myenv funciona correctamente
Versión de Python: 3.10.20</pre>
    </div>
  </div>

</div>


Hasta aquí termina este manual. Si deseas cononcer más información, puedes consultar las fuentes oficiales de <a href="https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html" target="_blank" rel="noopener noreferrer">mamba</a> y <a href=" https://docs.astral.sh/uv/#installation
" target="_blank" rel="noopener noreferrer">UV</a>.


