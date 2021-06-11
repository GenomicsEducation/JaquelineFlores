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
