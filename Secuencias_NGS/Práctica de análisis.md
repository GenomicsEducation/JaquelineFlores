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
![CONFIG](https://user-images.githubusercontent.com/80992964/121818019-5293db80-cc4a-11eb-90fe-518ce5f1b4b2.png)  
