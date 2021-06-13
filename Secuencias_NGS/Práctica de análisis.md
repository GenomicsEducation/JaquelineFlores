## **Introducción al análisis de secuencias NGS**  
Las tecnologías de secuenciación de próxima generación han evolucionado significativamente para proporcionar una mayor producción de datos (Taishan, Chitnis, Monos, & Dinh, 2021). Sin embargo, las plataformas son susceptibles a una amplia gama de fallas químicas e instrumentales (Stephan et al., 2014), por lo que, los datos obtenidos pueden tener un fuerte ruido de fondo, contaminación de los adaptadores, baja calidad de secuenciación, entre otros (He et al., 2020), lo que posteriormente representa problemas significativos en la precisión de la detección de variantes o regiones genómicas objetos de estudio. Por ello, el control de calidad, en el preprocesamiento de datos, se torna esencial, a fin de contar con datos limpios para evitar errores en análisis posteriores.  

### **Conectar a servidor Pomeo**  
Conectaremos al servidor de interés (en este caso conectaremos a POMEO) utilizando la dirección IP y puerto correspondientes (en este caso usaremos IP 200.54.220.141, puerto 22) y el software PuTTy con las claves de acceso correspondientes.  
![CONEXIÓN](https://user-images.githubusercontent.com/80992964/121816229-10659c80-cc40-11eb-9f8f-be799a5cb4c4.png)  


### **Configurar bioconda e instalación de software**  
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


### **Descarga de biomuestra desde SRA**  
Para esta práctica se trabajará con la biomuestra SRR2006763 proveniente de la cepa _Aquagen_ de _Salmo salar_ y a partir de esta se obtendrán dos archivos fastq, ya que los datos provienen de secuenciación pair-end.  
Biomuestra 1:SRR2006763_1.fastq  
Biomuestra 2:SRR2006763_2.fastq  

1. Para crear y ejecutar un archivo ejecutable (.sh) denominado download.sh, empleando nano:  
   1.1. `nano download.sh`  
   1.2. `bash download.sh`  
 _NOTAS: El archivo ejecutable permite descargar la biomuestra ya que incluye el comando `prefetch` que es parte del kit de herramientas de SRA y descarga archivos de secuencia en formato SRA comprimido. Además, incluye el comando `vdb-validate` que realiza chequeos luego de la descarga para asegurar que se ha realizado correctamente. Podrás encontrar el script [aquí](). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 4 líneas._  
2. Para comprobar que se creó el directorio de la secuencia descargada con el nombre SRR2006763, listar la carpeta _SRA_Samples_: `ls -l -h`  
3. Para acceder a la carpeta SRR2006763 y crear un script:  
   3.1. `cd SRR2006763`  
   3.2. `nano fdump.sh`  
   3.3. `bash fdump.sh`  
  _NOTA: El archivo ejecutable permite obtener los archivos fastq de la muestra SRR2006763. Al finalizar, además de extraer los archivos fastq debería indicarte el total de read leidos y escritos. Podrás encontrar el script [aquí](). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 3 líneas._  


![BIOMUESTRA](https://user-images.githubusercontent.com/80992964/121818822-23339d80-cc4f-11eb-8abd-d53c8b6f5af7.png)  


### **Comprobación de integridad de archivos**  
`md5sum` es un algoritmo empleado para evitar algún daño que pudo generarse por algún motivo durante el proceso de descarga.  
1. Para buscar el código Md5 de las muestras y direccionar la información a un archivo md5_samples: `md5sum SRR2006763_1.fastq SRR2006763_2.fastq > md5_samples`  
2. Para verificar la salida generada: `cat md5_samples`  
3. Para comprobar la integridad de las biomuestras usando md5sum: `md5sum -c md5_samples`  


![INTEGRIDAD](https://user-images.githubusercontent.com/80992964/121819522-20d34280-cc53-11eb-806c-9a6978027962.png)  


### **Análisis de control de calidad**  
Para el análisis de control de calidad de secuencias fastq que provienen de secuenciadores NGS, en el directorio SRR2006763 crear y correr un script:  
1. Crear y ejecutar un archivo ejecutable (.sh) denominado fastqc.sh, empleando nano:  
   1.1. `nano fastqc.sh`  
   1.2. `bash fastqc.sh`  
 _NOTAS: Podrás encontrar el script [aquí](). Cada palabra "USUARIO" cambiala por tu propio nombre de usuario. El script sólo tiene 3 líneas. La salida resultante de la ejecución del script anterior serán dos archivos, uno HTML y uno .ZIP._  
