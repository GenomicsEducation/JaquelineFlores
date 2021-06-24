# **Introducción al análisis de secuencias NGS: Alineamiento**  
El paso de alineación o mapeo de secuencias cortas reads producto de la secuenciación NGS a un genoma de referencia se considera una parte integral de los análisis de genomas (Pham-Quoc, Kieu-Do, & Thinh, 2019).  

El problema del mapeo de reads consiste en ubicar o alinear dentro de un genoma de referencia previamente secuenciado los millones de reads para luego ensamblarlas a un nuevo genoma (Bak, Bodziony, Migdałek, Pareek, & Żukowski§, 2020) o en el caso de que no exista un genoma de referencia realizar un ensamble de novo.Esta carga de trabajo se la realiza con diferentes enfoques de alineación, sin embargo, al igual que cualquier software, cada enfoque presenta diferentes formas de ejecución y consecuentemente de análisis.  

Para realizar esta tarea se han desarrollado varios programas como lo son, BWA (Li & Durbin, 2009), Bowtie 2 (JHU, 2016) y otros, cuya función principal es hacer coincidir secuencias cortas provenientes de NGS con secuencias de referencia (Bak, Bodziony, Migdałek, Pareek, & Żukowski§, 2020). Actualmente, BWA es un software muy popular para fines de alineamiento, debido a su compatibilidad con datos de Illumina y la integración de distintos algoritmos de alineamiento con mayor rendimiento para reads de distintas longitudes (Li & Durbin, 2009).  

El resultado del mapeo o alineamiento se guarda en un archivo d etexto plano con formato SAM (Sequence Alignment Map) o su equivalente comprimido en binario (BAM). Este archivo contiene de forma codificada toda la información de dónde y cómo cada read se alineo al genoma referencia. De el se pueden luego extraer información de variantes para análisis poblacional o estudios de asociación genómica o información de conteo de reads en regiones codificantes para en análisis de expresión de genes.  

_NOTA: Los scripts empleados en la presente práctica podrá encontrarlos en la carpeta [Scripts_alineamiento](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Alineamiento/Scripts_alineamiento) ubicada dentro del directorio [Alineamiento](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Alineamiento)._  


# **Interpretación del formato SAM**  
El formato SAM consta de un encabezado que comienza con el símbolo @ y una sección de alineamiento que contiene la información de cada uno de los reads que alineo al genoma de referencia. Para conocer más acerca del formato SAM puedes revisar el [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2723002/) que describe el formato o simplmente revisar la información que [wikipedia](https://en.wikipedia.org/wiki/SAM_(file_format)) explica sobre el mismo. Los archivos SAM se pueden analizar y editar con el software SAMtools. A continuación se muestra un ejemplo del formato SAM con los 11 campos obligatorios del alineamiento y 1 campo opcional.  

![SAM](https://user-images.githubusercontent.com/80992964/122462329-13cb9180-cf7a-11eb-8e00-c3a687e97f22.png)  

# **Notas importantes**  
## **Origen de las muestras**  
Para facilitar el proceso se utilizará una muestra que proviene de la base de datos SRA del NCBI, que corresponde a lecturas crudas del salmón del Atlántico _Salmo salar_ en formato fastq, obtenidas por secuenciación de extremos emparejados con un secuenciador Illumina HiSeq2000. La muestra se alineará al genoma de la mitocondria ya que por su pequeño tamaño, el alineamiento no debería tardar más de unos pocos minutos.

## **Etapas del alineamiento**  
 1. Descargar Genoma de referencia de la mitocondria e indexar.  
 2. Alinear muestra con genoma de referencia.  
 3. Analizar el resultado del alineamiento.  

# **Práctica de Alineamiento**  
## **Conexión a servidor**  
Conectaremos al servidor de interés utilizando la dirección IP y puerto correspondientes (en este caso conectaremos a POMEO con los datos: IP 200.54.220.141, puerto 22), mediante el software PuTTy y nuestra clave de acceso.
![POMEO](https://user-images.githubusercontent.com/80992964/122467043-a589cd80-cf7f-11eb-92fa-e48cf06fefb1.png)  

## **Configurar bioconda e instalar programas para análisis**  
1. Para configurar el canal bioconda se debe ejecutar el siguiente comando: `conda config --add channels bioconda`  
   _Al realizar la ejecución simplemente aparecera de nuevo la línea para escribir comandos, en mi caso aparece un mensaje que indica que ya tengo bioconda en mi lista de canales._  
2. Para la instalación del software bwa: `conda install -c bioconda bwa`  
  _Se realizará la instalación del software, recordar que en un punto pedirá inficar "y" o "yes" para continuar con la instalación._
3. Para la instalación del software samtools ejecute cada comando independiente:  
  3.1. `conda install -c bioconda samtools`  
  3.2. `conda config --add channels bioconda`  
  3.3. `conda config --add channels conda-forge`   
  3.4. `conda install samtools==1.11`  
4. Verificar directorios de instalación ejecutando los siguientes comandos de forma independiente:  
  4.1. `whereis sratoolkit`  
  4.2. `whereis samtools`  
  4.3. `whereis bwa`  
  
_NOTA: Recuerda que cuando ha terminado de ejecutarse algún comando aparecerá de nuevo la línea (base) dónde te encuentras trabajando, y aparecerá el cuadro de color que te indica que puedes escribir, esa es la señal de que se ha terminado de ejecutar un comando y que puedes continuar trabajando._  
![CONFIG](https://user-images.githubusercontent.com/80992964/122472300-061c0900-cf86-11eb-82f7-2e4a6d784002.png)  


## **Creación de directorio**  
Considerando que nuestras secuencias fastq originales, las trabajadas en la práctica de análisis, tuvieron muy buena calidad, podemos trabajar directamente con ellas. Para ambos casos debemos trasladar los archivos a una nueva carpeta, de la siguiente forma:  
1. Crear una carpeta denominada "alineamiento" en tu usuario de home2: `mkdir alineamiento`  
2. Ingresar a la carpeta: `cd alineamiento`  
3. Transferir los archivos de la clase anterior a la nueva carpeta, ejecutando los comandos uno por uno:  
  3.1. `mv /home2/usuario/SRA_samples/SRR2006763/SRR2006763_1.fastq /home2/usuario/alineamiento/`  
  3.2. `mv /home2/usuario/SRA_samples/SRR2006763/SRR2006763_2.fastq /home2/usuario/alineamiento/`  
4. Lista tu carpeta de alineamiento para verificar que tienes lo necesario para el alineamiento: `ls`  

_NOTA: En los comandos del punto 3, cambia la palabra "usuario" por tu nombre de usuario. En la lista del punto 4 deberías obtener como resultado los dos archivos que acabas de mover._  
![DIR](https://user-images.githubusercontent.com/80992964/122474092-58f6c000-cf88-11eb-9aa2-17f4efdd31f1.png)


## **Descarga de secuencias**  
Ahora descargaremos el genoma de referencia de la mitocondria de _Salmo salar_ en la misma carpeta de alineamiento. Para ello entra al siguiente [link](https://www.ncbi.nlm.nih.gov/genome/?term=salmo+salar) y sigue los pasos que se muestran en la siguiente imagen:  
![SALMO](https://user-images.githubusercontent.com/80992964/122481025-93b22580-cf93-11eb-93d6-bbfde7568342.png)  

## **Carga de secuencias a POMEO**  
Para esta parte utilizaremos WinSCP, debes iniciar sesión, guardar tus datos y conectarte como se indica en la siguiente imagen. Al conectar debes ingresar nuevamente tu contraseña y aparecerá la interfaz de tu servidor con las carpetas que tienes creadas, aquí ingresarás en tu carpeta de alineamiento y arrastrarás el archivo descagado del genoma mitocondrial a la misma. Cuando termines lo anterior puedes ingresar a POMEO, listar tu carpeta de alineamiento con `ls` y deberías ver tu archivo junto con tus secuencias fastq.   
![WINSCP](https://user-images.githubusercontent.com/80992964/122483002-40da6d00-cf97-11eb-81f3-abfffec4ec6c.png)  


## **Indexación del genoma de referencia**  
Una vez que incluiste en tu carpeta de alineamiento todos los archivos descritos en los pasos anteriores podemos proceder a la etapa inicial del alineamiento, que corresponde a la indexación del genoma de referencia con bwa usando el siguiente comando: `bwa index mt.fasta`  
_Nota: el comando dice mt.fasta porque así se llama el archivo, recuerda cambiar al nombre de tu propio archivo._  

La salida del comando dará como resultado 5 archivos con extensiones “amb”,“ann”,“bwt”,“pac” y “sa”.  
![INDEX](https://user-images.githubusercontent.com/80992964/122483372-09b88b80-cf98-11eb-8056-cff521407369.png)  


## **Alineamiento**  
Para el alineamiento tendremos las siguientes etapas:  
 - Alineamiento de las secuencias contra el genoma de referencia, cuya salida será un archivo con extensión “.sam”  
 - Conversión del archivo SAM a BAM  
 - Inspeccionar el archivo .sam de salida  
 - Ordenar lecturas alineadas por posición  
 - Indexación con Samtools  
 - Exploración de datos con Samtools  

Para ejecutar todas las etapas anteriores en ese orden se debe crear un script: `nano aln_mt.sh`  
_Nota: Encontrarás el script [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Alineamiento/Scripts_alineamiento/aln_mt.sh)._  

Al ejecutar el script tendras tus archivos SAM/BAM, y puedes observar tu archivo sam con el comando `less` de linux (recuerda que es un archivo de texto plano): `less SRR2006763.sam`  
![ALIN](https://user-images.githubusercontent.com/80992964/122484521-5f8e3300-cf9a-11eb-83ff-5f1625e307e2.png)  

Como puedes observar en el punto 4 de la imagen superior, cada secuencia contiene varias columnas. La primera columna hace referencia al nombre de la secuencia, y de ahí en delante cada número, signo o símbolo tiene un significado particular. Por ejemplo, puedes ejecutar el siguiente comando para identificar que significa cada número de la columna 2, sólo sustituye "(número)" por el número de interés: `samtools flags (número)`. Te dejo la siguiente tabla, donde encontrarás algunos comandos que puedes emplear, y en la siguiente imagen podrás ver un ejemplo de los resultados que obtendrías.    

| Comando | Función |
| ------------- | ------------- |
| `samtools flags unmap` | proporciona los reads no mapeados |
| `samtools flags 77`  | read 1 - emparejado no mapeado | 
| `samtools flags 141` | read 2 - emparejado no mapeado |
| `samtools flags 99` | Reverse de un read 1 adecuadamente emparejado |
| `samtools view -f 66 SRR2006763.bam head -n 10` | Busca solo reads emparejados en el archivo bam (agrega pipeline antes de head) |  


![FLAGS](https://user-images.githubusercontent.com/80992964/122486148-163fe280-cf9e-11eb-8e9f-27a327e71434.png)


También puedes realizar un análisis estadístico estandar con los siguientes comandos: `samtools flagstat SRR2006763.bam > muestra_stat.txt`  
![STAT](https://user-images.githubusercontent.com/80992964/122485732-3d49e480-cf9d-11eb-9398-e95092f2aeeb.png)  
De la información obtenida podemos determinar que hay un total de 4,395 lecturas que pasaron el control de calidad, y ninguna que no pasó dicho control. Asimismo, podemos decir que hay 2,196 lecturas del Read1 y 2,197 lecturas del Read2. Del total de lecturas (4,395) sólo 4,206 (95.74% del total de lecturas) se lograron aparear apropiadamente, es decir, tanto la secuencia forward como reverse se aparearon correctamente.  

## **Visualización del alineamiento en software IGV**  
Integrative Genomics Viewer (IGV) es una herramienta interactiva de alto rendimiento y fácil de usar para la exploración visual de datos genómicos. Admite la integración flexible de todos los tipos comunes de datos y metadatos genómicos, generados por investigadores o disponibles públicamente, cargados desde fuentes locales o en la nube.  

Para continuar con este ejercicio deberás descargar el software IGV, y lo podrás hacer ingresando en este [enlace](https://software.broadinstitute.org/software/igv/download). Una vez descargado, abre el visualizador para cargar el genoma de referencia lo que podrás lograr al dar click en el recuadro "more", como indica el paso 2 de la imagen de abajo. Esto abrirá una nueva ventana con los genomas precargados con los que cuenta IGV, ahí deberás buscar el genoma de _Salmo salar_ y dar click en "ok", tal como se indica en el pasos 3 de la imagen. Una vez hecho esto el genoma estará cargado, y aparecerán los identificadores de todos los cromosomas de esta especie y también el genoma de mitocondrial, el cual deberás seleccionar (NC_001960.1), como se muestra en el paso 4 de la imagen. Por último, deberás cargar tu archivo ".bam" de la alineación tal como se muestra en el paso 5 de la imagen. Cuando se cargue el genoma mitocondrial, se podrá visualizar la salida del alineamiento, como se nota en el paso 6 (última imagen).  


**_Pasos para visualización de genoma de referencia y mitocondrial._**
![IGV](https://user-images.githubusercontent.com/80992964/123194363-fa3fb380-d46b-11eb-9469-aa1fc8f13d22.png)  

**_Visualización de los datos genómicos._**  
![VISUAL](https://user-images.githubusercontent.com/80992964/123195086-2f003a80-d46d-11eb-97dc-40fb99e49f68.png)  

_Nota: El archivo del genoma visualizado tiene características como pistas de genes e ideogramas de cromosomas, puedes navegar a través de la imagen haciendo zoom sobre las regiones genómicas que desees explorar._  

