# Genética y Genómica Aplicada a la Producción Animal.  
En el presente repositorio encontrarán diversas actividades realizadas durante el curso Genética y Genómica Aplicada a la Producción Animal, del Doctorado en Biotecnología PUCV-UTSFM. En la sección actual se describe brevemente cada actividad y se incluyen enlaces para dirigirse a las carpetas correspondientes. En la sección superior encontrarán las carpetas aquí descritas.

## **Autor**  
Todas las actividades del presente repositorio son elaboradas por una servidora.  
Jaqueline Flores Salinas  
 - Mexicana  
 - Licenciado en Biotecnología Genómica  
 - Profesional en procesamiento de patentes    
   
# Práctica para la elaboración de un proyecto de genómica aplicada.  
Esta práctica incluye la elección de una especie de importancia económica en producción animal, la búsqueda de la información de su genoma secuenciado en la base de datos _Assembly_ y _RefSeq_ del NCBI (National Center for Biotechnology Information), y la busqueda de BioProyectos con información genómica en la base de datos _SRA_ (Sequence Read Archive) del NCBI.  

En la carpeta [Genomas_y_Bioproyectos](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Genomas_y_Bioproyectos) de este repositorio, podrán encontrar la especie que yo elegí, la información de su genoma y un BioProyecto de mi elección.  
 


## **Descarga, instalación y configuración de programas**  
### **Software para acceso remoto SSH**  
#### **_PuTTY_**  
Para la instalación de este software deberá hacer una búsqueda simple en su navegador, identificar la página web mostrada en el punto 1 de la imagen aquí adjunta (abajo) e ingresar en ella, o en su defecto ingresar a este [enlace](https://www.putty.org/). Deberá buscar en la página la opción "Download PuTTY" y, tal como se muestra en el punto 2 de la imagen de abajo, dar click en "here". Eso lo enviara a una sección similar a lo que se ve en el punto 3 de la imagen de abajo, ahí deberá descargar el software de acuerdo a las características de su computador.  
![PuTTY](https://user-images.githubusercontent.com/80992964/120689035-45683700-c469-11eb-82cf-a4a730a938e2.png)  

### **Software para transferencia de archivos vía FTP**  
#### **_WinSCP_**  
Para la instalación de este software deberá hacer una búsqueda simple en su navegador, identificar la página web mostrada en el punto 1 de la imagen aquí adjunta (abajo) e ingresar en ella, o en su defecto ingresar a este [enlace](https://winscp.net/eng/download.php). Eso lo enviara a una sección similar a lo que se ve en el punto 2 de la imagen de abajo, ahí deberá descargar el software dando click en la opción de descarga que se encuentra en un recuadro verde.  
![WinSCP](https://user-images.githubusercontent.com/80992964/120694611-0e495400-c470-11eb-873b-319d632f5e5e.png)  

### **Editor de textos**  
#### **_Nano_**  
Para la instalación de este editor deberá hacer una búsqueda simple en su navegador, identificar la página web mostrada en el punto 1 de la imagen aquí adjunta (abajo) e ingresar en ella, o en su defecto ingresar a este [enlace](https://www.nano-editor.org/). Eso lo enviara a una sección similar a lo que se ve en el punto 2 de la imagen de abajo, ahí deberá dirigirse a la opción "Get Nano". A continuación verá una pantalla similar a la mostrada en el punto 3, seleccione "The branches". Será redirigido a un listado de opciones, seleccione la opción mostrada en el punto 4 de la imagen de abajo. Por último será enviado a una pantalla como la mostrada en el punto 5, seleccione la opción ahí marcada, que se refiere a un archivo ".exe".    
![nano](https://user-images.githubusercontent.com/80992964/120694077-66338b00-c46f-11eb-896c-d70e1274dfdd.png)  

## **Acceso remoto a servidor POMEO**  
### **Empleando PuTTY y nano**  
Para ingresar de manera remota a POMEO debemos abrir la aplicación de PuTTY que previamente descargamos, veremos una pantalla similar a la que se muestra en el punto 1 de la imagen de abajo. Deberemos ingresar la dirección IP del servidor al que deseamos ingresar, darle un nombre y cargarlo. Posteriormente damos doble click al nombre del servidor y nos abrirá el editor nano, en una pantalla similar a la que se aprecia en el punto 2 de la imagen aquí mostrada. En el editor ingresaremos nuestros datos de acceso como nombre de usuario y contraseña, nos aparecerá un mensaje para confirmar que estamos dentro del servidor.
![POMEO](https://user-images.githubusercontent.com/80992964/120696681-713bea80-c472-11eb-9fc1-219c57940ac0.png)  

## **Instalación y configuración de paquetes**  
### **CONDA**  
Realizar la instalación de Miniconda tal como se muestra en la imagen de abajo, utilizando el comando e información siguiente:   
`wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`  
`bash Miniconda3-latest-Linux-x86_64.sh`  
_Nota: En mi caso aparece un error debido a que ya contaba con la instalación de miniconda._  
![CONDA](https://user-images.githubusercontent.com/80992964/120702478-bc0d3080-c479-11eb-8b61-a89007f3e758.png)  

### **Nano**  
Realizar la instalación del paquete nano utilizando el comando e información siguiente: `conda install -c conda-forge nano`  
![nano](https://user-images.githubusercontent.com/80992964/120700484-56b84000-c477-11eb-95c7-c581c9d87c3f.png)  

### **SRA toolkit**  
Realizar la instalación del SRA toolkit utilizando el comando e información siguiente:  
Con nano crear un documento llamado script2.sh : `nano script2.sh`  
Colocar la siguiente información en el documento:  
`# !/bin/bash`  
`# Descarga y descomprime SRA Toolkit`  
`wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz  
tar -xzf sratoolkit.current-centos_linux64.tar.gz`  
_Notas: Asegurate de que la información que le sigue a `wget` quede como una sola línea, como se muestra en la imagen. También asegurate de guardar los cambios utilizando `ctrl + o`, para salir del documento utiliza `ctrl + x`._  
![SRAtoolkit](https://user-images.githubusercontent.com/80992964/120906534-d6810e80-c61f-11eb-846e-e39488d12f4f.png)  

script2.sh para descarga [aquí](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Scripts)

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

### **_Atajos_**
- Moverte por las líneas ejecutadas en la terminal: `flecha arriba/abajo`  
- Usa el tabulador como un atajo para llamar al fichero: `tab`  
- Mueve el cursor al comienzo de la línea actual: `ctrl-a`  
- Mueve el cursor al final de la línea actual: `ctrl-e`  
- Borra desde el cursor hasta el final de la línea: `ctrl-k`  
- Borra desde el cursor hasta el inicio de la línea: `ctrl-u`  
- Borra la palabra inmediatamente detras del cursor: `ctrl-w`  

## **Práctica de descarga de secuencias NGS con SRA toolkit**  
### **_Comandos y su uso_**  
- Para descargar y descomprimir SRA toolkit:  
   - Crear script: `nano script2.sh`  
   - Dentro del archivo colocar los siguientes comandos en el orden en que aparecen (`wget` descarga y `tar` descomprime):  
   `# !/bin/bash`  
   `# Descarga y descomprime SRA Toolkit`  
   `wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz`  
   `tar -xzf sratoolkit.current-centos_linux64.tar.gz`  
- Configurar SRA toolkit para trabajar en la nube:  
   - Dirigirse primero al directorio /sratoolkit.2.10.5-centos_linux64: `cd /sratoolkit.2.10.5-centos_linux64`  
   - Configurar SRAtoolkit para trabajar en la nube: `bin/vdb-config --interactive`  

**_Simulación: trabajando con un archivo del SRA (archivos SRR390728 y SRR6019464)_**
- Para probar que SRAToolkit está trabajando correctamente: `fastq-dump --stdout SRR390728 | head -n 8`  
- Descarga y muestra el contenido de las 5 primeras secuencias del archivo: `fastq-dump -X 5 -Z SRR6019464`  
- Descarga el contenido de las 5 primeras secuencias y las almacena en un archivo con formato fastq: `fastq-dump -X 5 SRR6019464`  
- Descarga la biomuestra completa: `fastq-dump --gzip --split-3 SRR6019464`  
- Explorar la muesta y revisar el número de read descargados: `zcat SRR6019464.fastq.gz | echo $((``wc -l``/4))`  
