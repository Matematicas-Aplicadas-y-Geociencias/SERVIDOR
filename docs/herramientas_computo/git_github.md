# Git y Github

<!--
Correcciones:
- Uniformizar el tamaño de las imágenes
- Traducir la imagen que tiene inglés al español
- Mejorar la redacción (escribir en tercera persona)
- Investigar cómo poner salidas de terminal con css y html en vez de las imágenes
-->

<div class="alert alert-warning" role="alert">
  🚧 <strong>Sitio en construcción</strong> — Este contenido está en desarrollo y puede cambiar.
</div>

## Introducción

<h3>Git</h3>

<p>Es un <b>sistema de control de versiones</b> de código abierto que <em>registra los cambios en los archivos</em>. Te permite trabajar en tu propia copia de un proyecto, registrar un historial de tus cambios y fusionar tu trabajo con los cambios de otras personas de forma segura y eficiente.</p>

<h3>GitHub</h3>

<p>Es una <b>plataforma</b> que <em>respalda todo tu proceso</em> de desarrollo de software, desde la planificación del trabajo hasta el despliegue y la operación del software.</p>

<h3>Git y GitHub</h3>

<p><b>GitHub</b> se contruye sobre <b>Git</b> alojando tus proyectos de Git, llamados <b>repositorios</b>, en la nube, además de añadir herramientas de planificación y colaboración que facilitan el trabajo en equipos.</p>

## Instalación de Git

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_git_install" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_git_install" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>

 <!-- SECCION WINDOWS-->

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows_git_install">
    
    <p> </p>

    <p>Desde en menú de inicio, abre el <b>PowerShell</b> con clic derecho y selecciona la opción <b>Ejecutar como administrador</b>. Luego ejecuta el siguiente comando:</p>

    <pre><code>winget install --id Git.Git -e --source winget</code></pre>

    El sistema descargará el ejecutable y te preguntará si quieres abrir la aplicación como adiminstrador. Dale clic en <b>Aceptar</b> y se abrirá la <b>ventana de instalación</b>. Cuando termine de instalar, cierra y abre el <b>PowerShell</b> para que reconozca el comando, y verifica con:

    <pre><code>git --version</code></pre>

    <p>Te aparecerá lo siguiente:</p>

    <div class="powershell-output">

    <pre>git version 2.55.0.windows.5</pre>

    </div> 

    <p>¡Listo! Haz instalado Git en tu computadora.</p>

  </div>


 <!-- SECCION LINUX -->

    <div role="tabpanel" class="tab-pane" id="linux_git_install">
  
    <p> </p>

    <p>Abre una <b>terminal</b> y ejecuta el siguiente comando:</p>

    <pre><code>sudo apt update
sudo apt install git</code></pre>

    <p>Verifica si la instalación se realizó exitosamente:</p>

    <pre><code>git --version</code></pre>

    <p>Te aparecerá lo siguiente:</p>

    <div class="terminal-output" markdown="0">
     <pre>git version 2.43.0</pre>
    </div>
  
    <p>¡Listo! Haz instalado Git en tu computadora.</p>

  </div>

</div>

## Configuración de Git

<p>El siguiente paso importante es configurar Git con los datos necesarios para usarlo.</p>

<h4>Nombre de usuario</h4>

Se asigna con el siguiente comando, cambiando <code>Tu nombre</code> por el nombre que prefieras para tu usuario:

<pre><code>git config --global user.name "Tu_nombre"
</code></pre>

<h4>Correo electrónico</h4>

Cambia <code>tu@correo.com</code> por el correo de tu preferencia:

<pre><code>git config --global user.email "tu@correo.com"
</code></pre>

<h4>Editor de texto</h4>

Cambia <code>tu_editor</code> por el nombre del editor de texto que sueles usar:

<pre><code>git config --global core.editor "tu_editor"
</code></pre>

<h4>Rama principal</h4>

Vamos a utilizar la rama <code>main</code>:

<pre><code>git config --global init.defaultBranch main
</code></pre>

Para ver las **configuraciones** de git en el dispositivo (nombre, correo, editor de texto):

<pre><code>git config -l</code></pre>

## Creación de repositorio en Github

<p>Primero, crea una cuenta de Github mediante en siguiente enlace: <a href="https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home" target="_blank" rel="noopener noreferrer">crear cuenta de Github</a>. Posteriormente, sigue las indicaciones como se muestran a continuación:</p>

 <div class="auto-carousel" data-images='[
    {"src": "../../images/creacion_repositorio_1.png", "title": "Paso 1", "desc": "Ve a la sección \"Create New\"."},
    {"src": "../../images/creacion_repositorio_2.png", "title": "Paso 2", "desc": "Dale clic en <br>\"New repository\"."},
    {"src": "../../images/creacion_repositorio_3.png", "title": "Paso 3", "desc": "Define el nombre de tu repositorio."},
    {"src": "../../images/creacion_repositorio_4.png", "title": "Paso 4", "desc": "Añade una descripción."},
    {"src": "../../images/creacion_repositorio_5.png", "title": "Paso 5", "desc": "Escoge la visibilidad."},
    {"src": "../../images/creacion_repositorio_6.png", "title": "Paso 6", "desc": "Añade un \"READ ME\"."},
    {"src": "../../images/creacion_repositorio_7.png", "title": "Paso 7", "desc": "Deja \"No.gitignore\" por defecto."},
    {"src": "../../images/creacion_repositorio_8.png", "title": "Paso 8", "desc": "Selecciona la licencia \"GNU General Public License v3.0\"."},
    {"src": "../../images/creacion_repositorio_9.png", "title": "Paso 9", "desc": "Dale clic en \"Create repository\"."},
    {"src": "../../images/creacion_repositorio_10.png", "title": "Paso final", "desc": "¡Listo! Haz creado tu repositorio en GitHub."}
    ]'>
</div>

<p>¿Llegaste al paso final? ¡Felicidades! Haz creado tu primer repositorio en GitHub.</p>

## Instalación de Github CLI 

<p><b>GitHub CLI</b> te permite usar Github directamente desde la línea de comandos de la terminal o el PowerShell. En particular, conecta la computadora con tu repositorio de Github en la nube.</p>

<!-- CODIGO PARA SECCIONES WINDOWS Y LINUX -->

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows_githubcli" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#linux_githubcli" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
</ul>


 <!-- SECCION WINDOWS-->

<div class="tab-content">

  <div role="tabpanel" class="tab-pane active" id="windows_githubcli">
    
    <p> </p>
    <p>Abre el <b>PowerShell</b> y ejectua el siguiente comando:</p>
    
    <pre><code>winget install --id GitHub.cli --source winget</code></pre>

    El sistema realizará el proceso de instalación. En algún punto te preguntará si quieres permitir que la aplicación realice cambios en tu dispositivo. Le das clic a <b>Sí</b>. Al final debe aparecer "Instalado correctamente".

    <div class="powershell-output">

    <pre>
Encontrado GitHub CLI [GitHub.cli] Versión 2.102.0 

El propietario de esta aplicación le concede una licencia. 

Microsoft no es responsable, ni tampoco concede ninguna licencia de paquetes de terceros. 

El hash del instalador se verificó correctamente 

Iniciando instalación de paquete... 

Instalado correctamente</pre>
    </div>

    <p>Por último, cierra y abre el powershell para finalizar la instalación.</p>
 
  </div>


 <!-- SECCION LINUX -->

  <div role="tabpanel" class="tab-pane" id="linux_githubcli">
    
    <p> </p>

    <p>Abre una <b>terminal</b> y ejecuta el siguiente conjunto de comandos:</p>
    
    <pre><code>(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
    </code></pre>
  
  </div>

</div>

## Inicio de sesión con GitHub CLI

Utiliza el comando <code>gh</code> (de GitHub CLI) como sigue:

<pre><code>gh auth login</code></pre>

Saldrán varias opciones a escoger. Se tiene la opción de iniciar sesión a través del buscador. Lo importante aquí es seguir los pasos.Al final, todo el proceso de inicio de sesión se ve así:

<div class="terminal-output">
<pre><span class="user">?</span> Where do you use GitHub? <span class="path">GitHub.com</span>
<span class="user">?</span> What is your preferred protocol for Git operations on this host? <span class="path">HTTPS</span>
Authenticate Git with your GitHub credentials? <span class="path">Yes</span>
<span class="user">?</span> How would you like to authenticate GitHub CLI? <span class="path">Login with a web browser</span>

<span class="warn">!</span> First copy your one-time code: <strong>XAXX-XXDX</strong>
Press <strong>Enter</strong> to open https://github.com/login/device in your browser...
Gtk-<span class="user">Message</span>: <span class="timestamp">10:49:06.718</span>: Not loading module "atk-bridge": The functionality is provided by GTK natively. Please try to not load it.
<span class="user">✓</span> Authentication complete.
- gh config set -h github.com git_protocol https
<span class="user">✓</span> Configured git protocol
<span class="user">✓</span> Logged in as <strong>nombre-usuario</strong>
</pre>
</div>

### Clonación de SERVIDOR en local
Se crea una nueva carpeta (en la raíz de preferencia) donde contendrá los diferentes servidores que se utilicen. Luego se entrega a la misma carpeta:

```
mkdir repositorios
cd repositorios/
```

Dentro de la página de SERVIDOR en Github, le damos clic al botón verde que dice "Code"


![Figura2](images/descargar_repositorio.gif)


Se abre una ventana que ofrece dos opciones de clonación (vistas en clase): 
1. HTTPS
2. GitHub CLI

![Figura3|561](images/figura3.png)

La primera forma se copia la URL y en la terminal se ejecuta lo siguiente:
```
git clone "URL copiado de HTTPS"
```
La segunda forma se copia y pega el contenido de GitHub CLI y se ejecuta directamente. Para el caso de SERVIDOR:
```
git clone https://github.com/Matematicas-Aplicadas-y-Geociencias/SERVIDOR.git
```
En cualquier de los dos casos, sale lo siguiente:

![Figura4](images/figura4.png)

Esto crea una **carpeta** con todo lo contenido del reservorio de SERVIDOR en Github.

## Uso del reservorio SERVIDOR

Se entra a la carpeta de SERVIDOR y listamos el contenido, debe ser igual a lo visto en la página web de SERVIDOR en Github:
```
cd SERVIDOR/
ls
```
Para probar su uso, creamos un archivo llamado "ejemplo.py" con el comando ***touch***:
```
touch ejemplo.py
```
Para revisar el **status** del SERVIDOR tras el nuevo cambio, se ejecuta lo siguiente:
```
git status
```
Aparece lo siguiente:

![Figura5](images/figura5.png)

Existen tres áreas donde pueden "estar" nuestras modificaciones y/o nuevos archivos:
1. **Directorio de trabajo**
2. **Área de stage** (stage area)
3. **Commit**
Tras hacer la primera modificación, el archivo ejemplo.py se encuentra en el **directorio de trabajo**. Para moverlo al **área de stage**:
```
git add ejemplo.py
```
Si queremos mover todo lo realizado, se utiliza un punto:
```
git add .
```
Volvemos a revisar el status y aparece lo siguiente:

![Figura6](images/figura6.png)

Podemos modificar el archivo con ***vim***. Una vez hecho la modificación, revisamos de nuevo el status y aparece lo siguiente:

![Figura7](images/figura7.png)

Para que los cambios realizados al archivo ejemplo.py estén en el **área de stage**, usamos de nuevo el comando ***git add***. Aparece lo siguiente:

![Figura8](images/figura8.png)

Por último, para mover el archivo ejemplo.py al **commit**:
```
git commit
```
Se abrirá un archivo donde podemos poner **detalles** de los cambios realizados. Una vez guardados los cambios aparece lo siguiente:

![Figura9](images/figura9.png)

Si revisamos de nuevo el status:

![Figura10](images/figura10.png)

Si queremos ver un **registro** de todos los cambios hechos en el repositorio:
```
git log
```

![Figura11](images/figura11.png)

 Los código alfanuméricos largos en color café son números **hash**, y son identificadores únicos de cada cambio realizado. 

Para **subir** los cambios a la nube:
```
git push origin main
```

![Figura12](images/figura12.png)
 
 Para **bajar** los cambios hechos por otras personas:
```
 git pull
```

![Figura13](images/figura13.png)

Para regresar a un commit anterior o cambiar de ramas:
```
git checkout "insertar número hash"
```
Ejemplo:

![Figura14](images/figura14.png)

Si queremos ver un archivo sin editarlo, usamos el comando ***cat***:
```
cat ejemplo.py
```
Para **regresar** un archivo al **área de trabajo** (siempre que no se haya subido al repositorio):
```
git restore --staged ejemplo.py
```

### Creación de ramas
Se pueden crear **ramas** de **main**. Para visualizar todas las ramas:
```
git log --oneline --graph --decorate
```
**NOTA**: las ramas se ven en la terminal como la imagen de abajo, pero girado hacia la izquierda.

![Figura15](images/figura15.png)

Para ver en cuál rama estamos:
```
git branch
```

Para la creación de ramas, primero vamos al reservorio de SERVIDOR en la web de Github y creamos un nuevo "**Issue**", lo asignamos a nosotros, guardamos y le damos clic a crear rama. Copiamos el **código** y lo ejecutamos en la terminal. Por ejemplo, para la nueva rama "crear nuevo programa en python":
```
git fetch origin
git checkout 1-crear-nuevo-programa-en-python
```

![Figura16](images/figura16.png)

Al ejecutarlo, automáticamente nos cambia a la nueva rama, lo que se puede corroborar con ***git branch***. Una vez se hagan las ediciones correspondientes, se sube la rama al repositorio:
```
git push origin 1-crear-nuevo-programa-en-python
```
==**IMPORTANTE**: Después de este paso hay que ir al reservorio web y hacer un "**Pull request**" dirigido al profesor, quien revisará los cambios y decidirá si la rama se incluirá al main. Si acepta, podemos bajar el reservorio ya actualizado y las ramas se verían así:==

![Figura17](images/figura17.png)

Para **eliminar** una rama:
```
git branch -D 1-crear-nuevo-programa-en-python
```

---
Regresa al área de stage:

```
git reset --soft HEAD-1
```
Regresa al directorio de trabajo:

```
git reset --hard HEAD-1
```


















