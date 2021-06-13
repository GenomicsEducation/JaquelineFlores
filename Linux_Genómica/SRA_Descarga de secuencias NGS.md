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
- Para ejecutar y sacar datos, y así probar que SRAToolkit está trabajando correctamente: `bin/fastq-dump --stdout SRR390728 | head -n 8`  
- Descarga y muestra el contenido de las 5 primeras secuencias del archivo: `fastq-dump -X 5 -Z SRR6019464`  
- Descarga el contenido de las 5 primeras secuencias y las almacena en un archivo con formato fastq: `fastq-dump -X 5 SRR6019464`  
- Descarga la biomuestra completa: `fastq-dump --gzip --split-3 SRR6019464`  
- Explorar la muesta y revisar el número de read descargados: `zcat SRR6019464_1.fastq.gz | tail -8` `zcat SRR6019464_2.fastq.gz | tail -8`  
