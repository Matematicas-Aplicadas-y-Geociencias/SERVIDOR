# Seminario de Git y Github
### Configuración de Git desde la terminal

Revisar si está instalado git en el dispositivo:
```
git --version
```
Ver las **configuraciones** de git en el dispositivo (nombre, correo, editor de texto):
```
git config -l
```
Si no está configurado, configurar con lo siguiente:
- Nombre
```
git config --global user.name "escribir un nombre de usuario"
```
- Correo
```
git config --global user.email "escribir correo electrónico"
```
- Editor de texto
```
git config --global core.editor "nombre del editor"
```
- Rama principal (main)
```
git config --global init.defaultBranch main
```
### Instalación de Github CLI 
Sirve para conectar la computadora con el repositorio en la nube. Los comandos para instalarlo se obtuvieron de https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian.
```
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
```
Luego se **inicia sesión**:
```
gh auth login
```
Saldrán varias opciones a escoger. Se tiene la opción de iniciar sesión a través del buscador. Lo importante aquí es seguir los pasos.Al final, todo el proceso de inicio de sesión se ve así:
![Ejemplo](terminal1.png)

### Clonación de SERVIDOR en local
Se crea una nueva carpeta (en la raíz de preferencia) donde contendrá los diferentes servidores que se utilicen. Luego se entrega a la misma carpeta:
```
mkdir repositorios
cd repositorios/
```
Dentro de la página de SERVIDOR en Github, le damos clic al botón verde que dice "Code"

![[Pasted image 20260616181604 1.png]]

Se abre una ventana que ofrece dos opciones de clonación (vistas en clase): 
1. HTTPS
2. GitHub CLI
![[Pasted image 20260616181942.png|404]]
La primera forma se copia la URL y en la terminal se ejecuta lo siguiente:
```
git clone "URL copiado de HTTPS"
```
La segunda forma se copia y pega el contenido de GitHub CLI y se ejecuta directamente. Para el caso de SERVIDOR:
```
git clone https://github.com/Matematicas-Aplicadas-y-Geociencias/SERVIDOR.git
```
En cualquier de los dos casos, sale lo siguiente:
![[Pasted image 20260616184445.png]]
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
![[Pasted image 20260616184315.png]]

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
![[Pasted image 20260616190207.png]]

Podemos modificar el archivo con ***vim***. Una vez hecho la modificación, revisamos de nuevo el status y aparece lo siguiente:
![[Pasted image 20260616185931.png]]

Para que los cambios realizados al archivo ejemplo.py estén en el **área de stage**, usamos de nuevo el comando ***git add***. Aparece lo siguiente:
![[Pasted image 20260616190618.png]]

Por último, para mover el archivo ejemplo.py al **commit**:
```
git commit
```
Se abrirá un archivo donde podemos poner **detalles** de los cambios realizados. Una vez guardados los cambios aparece lo siguiente:
![[Pasted image 20260616190752.png]]

Si revisamos de nuevo el status:
![[Pasted image 20260616191010.png]]

Si queremos ver un **registro** de todos los cambios hechos en el repositorio:
```
git log
```
![[Pasted image 20260616191323.png]]
 Los código alfanuméricos largos en color café son números **hash**, y son identificadores únicos de cada cambio realizado. 

Para **subir** los cambios a la nube:
```
git push origin main
```
![[Pasted image 20260616191922.png]]
 
 Para **bajar** los cambios hechos por otras personas:
```
 git pull
```
![[Pasted image 20260616192027.png]]

Para regresar a un commit anterior o cambiar de ramas:
```
git checkout "insertar número hash"
```
Ejemplo:
![[Pasted image 20260616193024.png]]

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

![[Pasted image 20260616181604 1.png|665]]

Para ver en cuál rama estamos:
```
git branch
```
Para la creación de ramas, primero vamos al reservorio de SERVIDOR en la web de Github y creamos un nuevo "**Issue**", lo asignamos a nosotros, guardamos y le damos clic a crear rama. Copiamos el **código** y lo ejecutamos en la terminal. Por ejemplo, para la nueva rama "crear nuevo programa en python":
```
git fetch origin
git checkout 1-crear-nuevo-programa-en-python
```
![[Pasted image 20260616200707.png]]

Al ejecutarlo, automáticamente nos cambia a la nueva rama, lo que se puede corroborar con ***git branch***. Una vez se hagan las ediciones correspondientes, se sube la rama al repositorio:
```
git push origin 1-crear-nuevo-programa-en-python
```
==**IMPORTANTE**: Después de este paso hay que ir al reservorio web y hacer un "**Pull request**" dirigido al profesor, quien revisará los cambios y decidirá si la rama se incluirá al main. Si acepta, podemos bajar el reservorio ya actualizado y las ramas se verían así:==

![[Pasted image 20260616201247.png|697]]

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


















