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
