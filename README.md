# Práctica para la elaboración de un proyecto de genómica aplicada.

## **Autor**  
Jaqueline Flores Salinas  
 - Mexicana  
 - Licenciado en Biotecnología Genómica  
 - Profesional en procesamiento de patentes    
   
## **Información sobre Genomas y Bioproyectos**  
### **_Elección de una especie de importancia económica en producción animal._**  
_Sus scrofa domesticus_  
![Sus scrofa(pig)](https://biologydictionary.net/wp-content/uploads/2020/08/Young-domestic-pig.jpg)

### **Assembly**  
**Número de acceso:** ASM1795798v1  
**Organismo:** _Sus scrofa domesticus_  
**Raza:** Meishan  
**Sexo:** Femenino  
**Nivel de ensamblaje:** Cromosomas completos  
**Autor:** Chinese Academy of Agricultural Sciences  
**Fecha de envio:** Abril 15 de 2021


| Tamaño total de la secuencia | 2,510,037,796 |
| ------------- | ------------- |
| Número de scaffolds | 253 |
| Número de contigs  | 394 | 
| Número total de cromosomas | 19 |
| Secuencias sin ubicar | 234 |

Enlace de acceso: [Assembly](https://www.ncbi.nlm.nih.gov/assembly/GCA_017957985.1/)

### **Refseq**  
**Nombre:** _Sus scrofa domestica_ gen de la proteína GDF5, secuencia parcial  
**Número de acceso:** EU839903  
**Información de secuencia:** 456 bp de ADN linear  
**Autor:** Zabek,T. Immuno and Cytogenetics, National Research Institute of Animal Production, Poland. _Envío directo_.  
**Información del producto:** Factor de crecimiento / diferenciación 5. Está estrechamente relacionada con la familia de proteínas morfogenéticas óseas y es miembro de la superfamilia TGF-beta.  
Enlace de acceso: [Refseq](https://www.ncbi.nlm.nih.gov/nuccore/EU839903.1)

### **Bioproyecto SRA**  
**Título:** _"RNA samples in Hypothalamus of Pigs."_  
**Descripción:** Se eligieron ejemplares en tres etapas de la pubertad: antes, en y después de esta etapa. Se seleccionaron como prepuberes tres ejemplares de alrededor de 160 días sin signos puberales, tres ejemplares que presentaron los primeros signos púberes se seleccionaron como en la pubertad y tres ejemplares a los 14 días después de la fase puberal se seleccionaron como pospúberes.

**_Datos de experimento_**
| Número de acceso | Alcance | Fecha de envio | Enviado por |
| ------------- | ------------- | ------------- | ------------- |
| PRJEB39729 | Monoaislado | 15-Sep-2020 | YUAN |  

**_Librería_**  
| Instrumento | Estrategia | Fuente | Selección | Diseño |
|----------------|--------|-------|--------|-------------|
| Illumina HiSeq 2000 | RNA-Seq | Transcriptómica | ADNc | Pareado |  

**_Datos de análisis_**
| Corrida | Puntos | Bases | Tamaño | Publicación |
|---------|--------|-------|--------|-------------|
| ERR4419514 | 35,910,385 | 10.8G | 4Gb | 2020-09-15 |  

**_Datos del proyecto_**  

| Resource Name | Number of Links |  
| ------ | ------- |  
| Experimentos SRA | 9 |  
| BioSambple | 9 |  

**_Detalles de datos SRA_**  

| Parámetro	| Valor | 
| ------- | ------- |
| Volumen de datos | Gbases	92 |  
| Volumen de datos | Mbytes	36711 |

**Notas:** Documento con metadatos disponible en la sección superior de este repositorio como carpeta _"Metadata"_  
Enlace de acceso: [Bioproyecto SRA](https://www.ncbi.nlm.nih.gov/sra/ERX4361651[accn])  

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
Abrir primero un documento llamado script1.sh: `nano script1.sh`  
Colocar la siguiente información en el documento:  
`# !/bin/bash`  
`# Descarga y descomprime SRA Toolkit`  
`wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz  
tar -xzf sratoolkit.current-centos_linux64.tar.gz`  
_Notas: Asegurate de que la información que le sigue a `wget` quede como una sola línea, como se muestra en la imagen. También asegurate de guardar los cambios utilizando `ctrl + o`, para salir del documento utiliza `ctrl + x`._  
![SRAtoolkit](https://user-images.githubusercontent.com/80992964/120700554-68014c80-c477-11eb-9fb7-d47787d4ebb2.png)  

## **Práctica de SHELL y LINUX**  
### **Comandos y su uso**  

## **Práctica de descarga de secuencias NGS con SRA toolkit**  
### **Comandos y su uso**  
