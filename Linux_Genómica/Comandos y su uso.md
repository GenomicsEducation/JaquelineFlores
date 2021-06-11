## **Práctica de SHELL y LINUX**  
Los script son pequeños archivos con un conjunto de instrucciones para realizar alguna tarea o proceso bioinformático, es decir son programas. El uso de scripts nos permite automatizar y acelerar el trabajo de bioinformática. Se suelen escribir en un editor de texto y se almacenan en el directorio de trabajo con un nombre que lleva la extención ".sh" (ej. script_alineamiento.sh). Adicionalmente, un editor de texto, como lo es nano, es un sencillo programa informático que nos permite crear y modificar archivos digitales.  

### **_Comandos y su uso_**  
- Información de la versión del software bash: `bash --version`  
- Indica el nombre del directorio en el que se encuentra: `pwd`  
- Informa acerca del espacio total en el sistema, espacio usado, espacio disponible: `df -hP`  
- Evalua el performance de la CPU, similar al monitor del sistema: `top`  
- Para salir: `q`  
- Para crear un director: `mkdir`  
   - EJEMPLO - Crear un directorio llamado tesis: `mkdir tesis`  
- Para cambiar de directorio: `cd`  
   - EJEMPLO - Para cambiar al directorio llamado tesis: `cd tesis`  
- Para volver al directorio anterior: `cd ..`  
- Para almacenar información de un espacio a otro: `>`  
   - EJEMPLO - Para almacenar espacio del sistema en un archivo de formato ".txt": `df -hP > espacio_libre_pomeo.txt`  
- Para leer datos de un archivo e imprimir su contenido: `cat`  
   - EJEMPLO - `cat espacio_libre.txt`  
- Para leer datos de un archivo sin imprimir su contenido: `less`  
   - EJEMPLO - `less espacio_libre.txt`  
- Para contar líneas, palabras y carcateres de un fichero: `wc`  
   - EJEMPLO - `wc espacio_libre.txt`  
- Para imprimir un listado de objetos en un directorio: `ls`  
- Entrega información con mas detalle de los objetos y de un tamaño que sea legible por humanos: `ls -l -h`  
- Para remover un fichero o directorio forzando la acción: `rm -r`  
- Imprime todas las líneas de comando ejecutadas en la terminal: `history`  
- Para cerrar sesión/cerrar PuTTY de forma correcta: `exit`  
- Descargar repositorios: `wget`  
   - EJEMPLO - Descargar repositorio de anaconda: `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`  
- Ejecutar scripts: `bash nombre_de_archivo.sh`  
   - EJEMPLO - Ejecutar anaconda: `bash Miniconda3-latest-Linux-x86_64.sh`  
- Ejecución en el proceso actual: `source`  
   - EJEMPLO - Activación de miniconda: `source ~/.bashrc`  
- Revisión de contenidos (funciona igual que `ls`): `list`  
   - EJEMPLO - Revisión de contenidos de conda: `conda list`  
- Revisión de versión de repositorio descargado: `--version`  
   - EJEMPLO - Revisión de versión conda: `conda --version`  
- Instalación de nano en conda: `conda install -c conda-forge nano`  
- Creación de un script: `nano nombredelscript.sh` 
   - EJEMPLO - Creación de script llamado script1: `nano script1.sh`
- Guardar cambios en script: `ctrl + o`, seguido un `ENTER`  
- Salir del script: `ctrl + x`  

### **_Práctica para creación de script_**  
1. Ingresa el siguiente comando en tu editor de textos `nano nombredelscript.sh`. Esto creará un archivo llamado "script1" con extensión ".sh", esta extensión indica que se trata de un script. Al dar enter al comando se abrira este archivo y en esta sección podrás escribir lo que quieras que contenga el script.  
2. Para casos prácticos ingresa la siguiente información:  
`# !/bin/bash`  
`# Mi primer script`  
`echo Curso de Genómica`  
_Recuerda guardar con Ctrl+O, dar Enter y cerrrar con Ctrl+X_  
3. Al salir del archivo regresaras al editor de texto dónde haz estado trabajando, ahora para verificar que todo este correcto, corre el script con el comando `bash script1.sh`.
   _Podrás encontrar el script1.sh [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Linux_Gen%C3%B3mica/Scripts/script1.sh)_  

### **_Atajos_**
- Moverte por las líneas ejecutadas en la terminal: `flecha arriba/abajo`  
- Usa el tabulador como un atajo para llamar al fichero: `tab`  
- Mueve el cursor al comienzo de la línea actual: `ctrl-a`  
- Mueve el cursor al final de la línea actual: `ctrl-e`  
- Borra desde el cursor hasta el final de la línea: `ctrl-k`  
- Borra desde el cursor hasta el inicio de la línea: `ctrl-u`  
- Borra la palabra inmediatamente detras del cursor: `ctrl-w`
