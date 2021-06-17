# **Introducción al análisis de secuencias NGS**  
Las tecnologías de secuenciación de próxima generación han evolucionado significativamente para proporcionar una mayor producción de datos (Taishan, Chitnis, Monos, & Dinh, 2021). Sin embargo, las plataformas son susceptibles a una amplia gama de fallas químicas e instrumentales (Stephan et al., 2014), por lo que, los datos obtenidos pueden tener un fuerte ruido de fondo, contaminación de los adaptadores, baja calidad de secuenciación, entre otros (He et al., 2020), lo que posteriormente representa problemas significativos en la precisión de la detección de variantes o regiones genómicas objetos de estudio. Por ello, el control de calidad, en el preprocesamiento de datos, se torna esencial, a fin de contar con datos limpios para evitar errores en análisis posteriores.  

_NOTA: Todos los scripts empleados en la presente práctica podrá encontrarlos en la carpeta [Scripts_análisis](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/An%C3%A1lisis/Scripts_an%C3%A1lisis) ubicada dentro del directorio [Análisis](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/An%C3%A1lisis)._  

## **Conectar a servidor**  
Conectaremos al servidor de interés (en este caso conectaremos a POMEO) utilizando la dirección IP y puerto correspondientes (en este caso usaremos IP 200.54.220.141, puerto 22) y el software PuTTy con las claves de acceso correspondientes.  
![CONEXIÓN](https://user-images.githubusercontent.com/80992964/121816229-10659c80-cc40-11eb-9f8f-be799a5cb4c4.png)  


## **Configurar bioconda e instalación de software**  
1. Para configurar el canal bioconda se debe ejecutar el siguiente comando: `conda config --add channels bioconda`  
   _Al realizar la ejecución simplemente aparecera de nuevo la línea para escribir comandos._  
2. Para buscar software en bioconda antes de instalar ejecute los siguientes comandos por separado:  
  2.1. `conda search -c bioconda fastqc`  
  2.2. `conda search -c bioconda trimmomatic`  
  _La ejecución de estos comandos arrojará un listado de los canales y versiones._  
3. Para la instalación de los software proceda a ejecutar los siguientes comandos por separado:  
  3.1. `conda install -c bioconda fastqc`  
  3.2. `conda install -c bioconda trimmomatic`  
  _Se realizará la instalación de estos softwares, recordar que en un punto pedirá inficar "y" o "yes" para continuar con la instalación._
4. Para crear un directorio llamado SRA_samples: `mkdir SRA_samples`  
  4.1. Para acceder al directorio: `cd SRA_samples`  
  
  
_NOTA: Recuerda que cuando ha terminado de ejecutarse algún comando aparecerá de nuevo la línea (base) dónde te encuentras trabajando, y aparecerá el cuadro de color que te indica que puedes escribir, esa es la señal de que se ha terminado de ejecutar un comando y que puedes continuar trabajando._  
![CONFIG](https://user-images.githubusercontent.com/80992964/121818511-5117e280-cc4d-11eb-896f-17fdedb3541b.png)  


## **Descarga de biomuestra desde SRA**  
Para esta práctica se trabajará con la biomuestra SRR2006763 proveniente de la cepa _Aquagen_ de _Salmo salar_ y a partir de esta se obtendrán dos archivos fastq, ya que los datos provienen de secuenciación pair-end.  
Biomuestra 1:SRR2006763_1.fastq  
Biomuestra 2:SRR2006763_2.fastq  

1. Para crear y ejecutar un archivo ejecutable (.sh) denominado download.sh, empleando nano:  
   1.1. `nano download.sh`  
   1.2. `bash download.sh`  
 _NOTAS: El archivo ejecutable permite descargar la biomuestra ya que incluye el comando `prefetch` que es parte del kit de herramientas de SRA y descarga archivos de secuencia en formato SRA comprimido. Además, incluye el comando `vdb-validate` que realiza chequeos luego de la descarga para asegurar que se ha realizado correctamente. Podrás encontrar el script [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Scripts/download.sh). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 4 líneas._  
2. Para comprobar que se creó el directorio de la secuencia descargada con el nombre SRR2006763, listar la carpeta _SRA_Samples_: `ls -l -h`  
3. Para acceder a la carpeta SRR2006763 y crear un script:  
   3.1. `cd SRR2006763`  
   3.2. `nano fdump.sh`  
   3.3. `bash fdump.sh`  
  _NOTA: El archivo ejecutable permite obtener los archivos fastq de la muestra SRR2006763. Al finalizar, además de extraer los archivos fastq debería indicarte el total de read leidos y escritos. Podrás encontrar el script [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Scripts/fdump.sh). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 3 líneas._  


![BIOMUESTRA](https://user-images.githubusercontent.com/80992964/121818822-23339d80-cc4f-11eb-8abd-d53c8b6f5af7.png)  


## **Comprobación de integridad de archivos**  
`md5sum` es un algoritmo empleado para evitar algún daño que pudo generarse por algún motivo durante el proceso de descarga.  
1. Para buscar el código Md5 de las muestras y direccionar la información a un archivo md5_samples: `md5sum SRR2006763_1.fastq SRR2006763_2.fastq > md5_samples`  
2. Para verificar la salida generada: `cat md5_samples`  
3. Para comprobar la integridad de las biomuestras usando md5sum: `md5sum -c md5_samples`  


![INTEGRIDAD](https://user-images.githubusercontent.com/80992964/121819522-20d34280-cc53-11eb-806c-9a6978027962.png)  


## **Análisis de control de calidad**  
Para el análisis de control de calidad de secuencias fastq que provienen de secuenciadores NGS, en el directorio SRR2006763 crear y correr un script.  
1. Crear y ejecutar un archivo ejecutable (.sh) denominado fastqc.sh, empleando nano:  
   1.1. `nano fastqc.sh`  
   1.2. `bash fastqc.sh`  
 _NOTAS: Podrás encontrar el script [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Scripts/fastqc.sh). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 3 líneas. La salida resultante de la ejecución del script anterior serán dos archivos, uno HTML y uno .ZIP._  


![CALIDAD](https://user-images.githubusercontent.com/80992964/121820520-d81e8800-cc58-11eb-9134-dcdfa20152fc.png)  


Una vez realizado el análisis anterior deberemos transferir los archivos mediante protocolo FTP, sin embargo si el servidor al que estas accesando tiene instalado RStudio server, como en esta activdad, es posible acceder a todos los archivos, reportes y carpetas creados, directamente ingresando al servidor, en este caso sería a traves del puerto 8787, con el mismo acceso con el que ingresamos a POMEO. La imagen inferior muestra como en esta actividad accedimos a los archivos obtenidos.  

El archivo HTML con la información de las secuencias lo podrás revisar [aquí](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/fastqc_seq).  


![RSERVER](https://user-images.githubusercontent.com/80992964/121820660-b245b300-cc59-11eb-8a33-3ec1d2437c04.png)  


## **Filtrado y poda**  
Deberemos entrar a la carpeta donde constan los archivos fastq (SRR2006763) y ejecutar un script.
1. Crear y ejecutar un archivo ejecutable (.sh) denominado trimm.sh, empleando nano:  
   1.1. `nano trimm.sh`  
   1.2. `bash trimm.sh`  
 _NOTAS: Podrás encontrar el script [aquí](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Scripts/trimm.sh). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 3 líneas. De la ejecución anterior, resultarán 4 archivos comprimidos._  
2. Descomprimir los archivos: `gunzip SRR20067634_filtered_1P.fastq.gz`  
3. Realizar un análisis de calidad de las muestras y comparar con el reporte de calidad inicial: `fastqc  *.fastq.gz`   

De la misma forma como hicimos antes para acceder a los archivos mediante RStudio server, ingresaremos nuevamente para revisar los archivos obtenidos después del filtrado y poda de las secuencias.  

Los archivos HTML con la información de las secuencias los podrás revisar [aquí](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/fastqc_seq).  


![RSTUDIO](https://user-images.githubusercontent.com/80992964/121821205-3c434b00-cc5d-11eb-8cf6-908d1d6032fa.png)  

Al hacer una comparación de la información de las secuencias filtradas respecto a las originales, se puede observar que estás han sido exitosamente podadas. La tabla que resume información al inicio de cada archivo nos indica que se eliminaron fragmentos inferiores a 60bp, reduciendo el rango de 43-98pb a 60-98pb. Sin embargo, como siguen existiendo fragmentos pequeños en los sets de datos, el apartado de "Sequence Length Distribution" presenta un signo de exclamación en color naranja, en lugar de una paloma en color verde.
