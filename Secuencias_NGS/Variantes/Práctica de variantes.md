# **Introducción al llamado de variantes de secuencias NGS**  
Uno de los principales usos de la secuenciación de próxima generación es descubrir variantes genéticas o mutaciones entre individuos que pertenecen a diferentes poblaciones (Danecek et al., 2011). Con este fin, se han desarrollado tuberías que incluyen el procesamiento de grandes volúmenes de datos como el proyecto internacional [1000 genomas humanos](https://www.internationalgenome.org/), o el [proyecto chileno](http://www.1000genomas.cl/) de 1000 genomas que pretende secuenciar e identificar varianes en 1000 personas y en algunas especies endémicas de interes.  

Uno de los softwares más empleados para realizar esta tarea denominada “llamado de variantes”, es [GATK](https://gatk.broadinstitute.org/hc/en-us), que se comprende como un kit de herramientas de análisis de genomas desarrollado por el Broad Institute de los Estados Unidos, que tiene la capacidad de realizar gran parte del análisis requerido para llamar variantes genómicas (Deatherage, 2020).  

El presente trabajo tiene por objeto realizar el llamado de variantes y la anotación de una muestra secuenciada mediante el uso de GATK, Linux, vcftools y otras herramientas de anotación y visualización de la región blanco.  

# **Formato VCF**  
![VCF](https://user-images.githubusercontent.com/80992964/123888195-93f9db80-d918-11eb-9b15-3527101d259e.png)  
Estructura formato VCF, tomado de: https://www.slideshare.net/AmazonWebServices/dat311-largescale-genomic-analysis-with-amazon-redshift  

_NOTA: Los scripts empleados en la presente práctica podrá encontrarlos en la carpeta [Scripts_variantes]() ubicada dentro del directorio [Variantes](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Variantes)._  


# **Notas importantes**  
## **Softwares bioinformáticos**  
[GATK](https://gatk.broadinstitute.org/hc/en-us) o Genome Analysis Toolkit, es un software que presenta ciertas ventajas para el llamado de variantes, como, la integración de evidencia de variantes de múltiples muestras con genotipado conjunto, permite el uso de polimorfismos de un solo nucleótido (SNP) e Indels validados para mejorar la precisión de la llamada de variante y sus métodos se implementan de una manera susceptible a lecturas que se originan en una variedad de preparación de plantillas (McCormick, Truong, & Mullet, 2015). Sin embargo y aunque, como se ha visto, la precisión de esta tubería ya es alta, los falsos positivos (FP) siguen siendo inevitables, por lo que, después de la llamada de variantes, se recomienda filtrar los FP como parte de las buenas prácticas del software (Tan, Zhang, Yang, & Yin, 2020).  

[PICARD TOOLS](https://broadinstitute.github.io/picard/) Es un conjunto de herramientas para manipular datos y formatos de secuenciación de alto rendimiento (HTS) como SAM/BAM/CRAM y VCF. El kit de herramientas de Picard es de código abierto y gratuito para todos los usos.  

[HAPLOTYPECALLER](https://gatk.broadinstitute.org/hc/en-us/articles/360035531412-HaplotypeCaller-in-a-nutshell) es una herramienta que contiene una serie de funciones aplicadas al descubrimiento de variantes de la línea germinal de ADN.  

[VCFtools](https://vcftools.github.io/index.html) es un software diseñado para trabajar con archivos VCF, como los generados por el Proyecto 1000 Genomas. El objetivo de VCFtools es proporcionar métodos de fácil acceso para trabajar con datos complejos de variación genética en forma de archivos VCF. El manual actualizado de comandos se puede encontrar en este [link](https://vcftools.github.io/man_latest.html).  

## **Origen de las muestras**  
Se realiza el llamado de variantes de una secuencia de _Salmo salar_ obtenida por secuenciación de extremos emparejados.  

Las muestras SRR2009653.fastq_1, SRR2009653.fastq_2. Provienen de un set de 45 secuencias de salmón del atlántico obtenidas por secuenciación de extremos emparejados con Illumina HiSeq2000 para analizar la resistencia a la necrosis pancreática infecciosa (IPN), con el fin de identificar polimorfismos que mostraban un gran contraste entre peces resistentes o susceptibles al IPN.  

## **Etapas del llamado de variantes**  
 1. Descarga de secuencia y genoma de referencia.  
 2. Indexación del genoma de referencia.  
 3. Descarga, filtrado y alineamiento de secuencia de estudio (Secuencia sort.bam).  
 4. Añadir grupos de lectura al archivo “bam”.  
 5. Indexación del archivo obtenido al añadir los grupos de lectura.  
 6. Identificación de variantes con HaplotypeCaller de GATK.  
 7. Análisis de variantes con linux y vcftools.  
 8. Visualización de variantes con IGV.  


# **Práctica de Alineamiento**  
## **Conectar a servidor**  
Conectaremos al servidor de interés utilizando la dirección IP y puerto correspondientes (en este caso conectaremos a POMEO con los datos: IP 200.54.220.141, puerto 22), mediante el software PuTTy y nuestra clave de acceso.  
![POMEO](https://user-images.githubusercontent.com/80992964/123889420-1b484e80-d91b-11eb-8d43-ec3227073a02.png)  

## **Configurar bioconda e instalar programas para análisis**  
1. Para configurar el canal bioconda se debe ejecutar el siguiente comando: `conda config --add channels bioconda`  
   _Al realizar la ejecución simplemente aparecera de nuevo la línea para escribir comandos, en mi caso aparece un mensaje que indica que ya tengo bioconda en mi lista de canales._  
2. Para la instalación del software gatk4: `conda install -c bioconda gatk4`  
  _Se realizará la instalación del software, recordar que en un punto pedirá inficar "y" o "yes" para continuar con la instalación._
3. Para la instalación del software picard tools: `wget https://github.com/broadinstitute/picard/releases/download/2.8.1/picard.jar`  
4. Para la instalación los software vcftools: `conda install -c bioconda vcftools`  

_NOTA: Recuerda que cuando ha terminado de ejecutarse algún comando aparecerá de nuevo la línea (base) dónde te encuentras trabajando, y aparecerá el cuadro de color que te indica que puedes escribir, esa es la señal de que se ha terminado de ejecutar un comando y que puedes continuar trabajando._  
![CONFIG](https://user-images.githubusercontent.com/80992964/123894080-2bfcc280-d923-11eb-93af-e24be42ec226.png)  


## **Creación de directorio**  
Para el caso de esta práctica el directorio y los archivos necesarios para ejecutar esta práctica ya habían sido creados e instalados en mi directorio personal, por lo que solo era necesario ingresar a el y explorar los archivos de trabajo. Usted deberá crear el directorio y para ello dejo las indicaciones completas.
1. Crear una carpeta denominada "variant_call" en tu usuario de home2: `mkdir variant_call`  
2. Ingresar a la carpeta: `cd variant_call`  
3. Listar los archivos que están contenidos en la carpeta: `ls -l -h`  
_El archivo contiene los siguientes archivos necesarios para efectuar el llamado de variantes:  
"SRR2006763.sort.bam": previamente obtenido con las actividades aprendidas en clases anteriores.  
ref_genome.fna: genoma de referencia de _Salmo salar_ en formato FASTA  
ref_genome.fna.fai: archivo indexado del genoma de referencia con 5 columna que corresponden a columnas 1= contig, 2 = tamaño, 3= ubicación, 4= basesPerLine y 5= bytesPerLine._  
4. Explorar los archivos "ref_genome.fna" y "ref_genome.fna.bai" con los siguientes comandos:  
_El genoma de salmon tiene 29 cromosomas denominados NC_027300.1, NC_027301.1, NC_027302.1, hasta el NC_027328.1, pero además muchos contigs sin mapear a ninguno de ellos los que puede identificar porque comienzan con NW por ejemplo NW_012341867.1._  
 4.1.`less`  
     `less ref_genome.fna`  
     `less ref_genome.fna.fai`  
 4.2.`head`  
     `head -n 20 ref_genome.fna`  
     `head -n 30 ref_genome.fna.fai`   
 4.3.`tail`  
     `tail -n 20 ref_genome.fna`  
     `tail -n 20 ref_genome.fna.fai`  
5. Investigue ahora los cromosomas del salmón con los siguientes comandos:  
    `grep 'NC_' ref_genome.fna`  
    `grep -c 'NC_' ref_genome.fna`  
    `grep 'NC_' ref_genome.fna.fai`  
    `grep -c 'NC_' ref_genome.fna.fai`  
6. Investigue ahora los contigs no mapeados del salmón con los siguientes comandos:  
    `grep -c 'NW_' ref_genome.fna`  
    `grep -c 'NW_' ref_genome.fna.fai`  
_Note que en todos los casos el comando trabaja más rápido en el archivo indexado ".fai". Como referencia puedes revisar las imagenes inferiores para darte una idea de que tendrás que obtener como resultado de cada comando._  

![1-4](https://user-images.githubusercontent.com/80992964/123893194-93197780-d921-11eb-9c7f-a264fafab23d.png)  
![5-6](https://user-images.githubusercontent.com/80992964/123893602-55691e80-d922-11eb-9813-b3b0c3e7c803.png)  


## **LLamado de variantes**  
1. Para realizar el llamado de variantes debe obtener primero un archivo que representará un "diccionario de referencias" del genoma de referencia: `java -jar picard.jar CreateSequenceDictionary R=ref_genome.fna O=ref_genome.dict`  
_Nota: La salidad del comando anterior será un archivo con extensión .dict, explorero con less o head._  
2. Añadir grupos de reads al archivo sort bam:  
  `java -jar picard.jar AddOrReplaceReadGroups I=SRR2006763.sort.bam O=SSRR2006763_sorted_RG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample`  
3. Indexar archivo generado con Read groups: `samtools index SSRR2006763_sorted_RG.bam`  
4. Para el llamado de variantes se debe ejecutar el comando `HaplotypeCaller` del software GATK, debe considerar que este proceso demorará al menos una hora:  
  `gatk HaplotypeCaller -R ref_genome.fna -I SRR2006763_sorted_RG.bam -O raw_variants.vcf`  
5. Al culminar la ejecución del comando liste su directorio y verifique que se ha creado su archivo de salida: `ls`  
_Nota: Deberá obtener el archivo "raw_variants.vcf"._  
7. Explore el archivo de llamado de variantes con los comandos less, head, tail:  
  `less raw_variants.vcf`  
  `head -n 30 raw_variants.vcf`  
  `tail -n 30 raw_variants.vcf`  
_Note que la mayoría corresponde a los cromosomas y contigs, por lo que las variantes están muy abajo en el archivo y solo podemos ver algunas variantes del genoma mitocondrial cuando usamos el comando tail._  
8. Use grep para contar el numero de líneas en el "vcf header": `grep "^#" -c  raw_variants.vcf`  
9. Use grep para contar el número de variantes detectadas: `grep "^#" -c -v raw_variants.vcf`  

10. El llamado de variantes lo hemos hecho con una sola biomuestra, por lo que podríamos listar el nombre de esta muestra usando el siguiente comando: `grep "^#CHROM" raw_variants.vcf | cut -f 10-`  

¿Cómo entender la codificación de los archivos vcf?  
La principal complejidad de los archivos vcf radica en la forma en que está codificada la información contenida en el. Afortunadamente en el mismo archivo podemos encontrar alguna información para poder comprender de mejor forma como interpretar las variantes encontradas.  
11. Ejecute el siguiente comando para imprimir el nombre de las columnas del llamado de variantes: `grep "^#CHROM" raw_variants.vcf`  
12. Ejecute el siguiente comando para listar las 10 primeras variantes: `grep "^#" -v raw_variants.vcf | head`  
13. Ejecute los siguientes comandos para entender la codificación de la columna "INFO" y "FORMAT" que contine la información del genotipo de la muestra para las primeras 10 variantes:  
  `grep "##INFO" raw_variants.vcf`  
  `grep "##FORMAT" raw_variants.vcf`  

Extraer variantes con alta calidad  
Ya hemos determinado que existen cera de 50.000 variantes, pero no todas ellas tienen alta calidad, lo que está determinado básicamente por el numero de reads sobre los cuales se han identificado las variantes. En terminos muy básicos la mayor calidad estará dada por un alto número de reads. Use el siguiente comando para extraer las variantes con calidad mayor a 100. Note que el comando se divide en tres partes, la primera extrae solo las variantes del archivo ".vcf", luego con un pipeline y el comando `awk` de linux extraemos e imprimimos solo las filas con calidad mayor a 100 (en la columna 6 está la calidad) y finalmente llevamos el print a un fichero denominado "hq_variant.txt" (variantes de alta calidad) el cual podemos explorar.  
14. Comando para extraer, imprimir y pasar a fichero: `grep -v "#" raw_variants.vcf | awk '{if ($6 > 100 ) print }' > hq_variant.txt`
15. Comandos para explorar:  
  `grep "NC_" -c -v hq_variant.txt`  
  `grep "NW_" -c -v hq_variant.txt`  

![pasos](https://user-images.githubusercontent.com/80992964/123895362-55b6e900-d925-11eb-8ddb-be24986b7b27.png)  
![variantes](https://user-images.githubusercontent.com/80992964/123895375-5fd8e780-d925-11eb-82b6-4014e0effe36.png)  
![final](https://user-images.githubusercontent.com/80992964/123895444-7b43f280-d925-11eb-81fb-f0c18b3e3f45.png)


