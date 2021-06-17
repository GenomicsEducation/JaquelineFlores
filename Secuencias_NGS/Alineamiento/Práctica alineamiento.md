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
Para facilitar el proceso se utilizará una muestra que provieme de la base de datos SRA del NCBI, que corresponde a lecturas crudas del salmón del Atlántico _Salmo salar_ en formato fastq, obtenidas por secuenciación de extremos emparejados con un secuenciador Illumina HiSeq2000. La muestra se alineará al genoma de la mitocondria ya que por su pequeño tamaño, el alineamiento no debería tardar más de unos pocos minutos.

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
