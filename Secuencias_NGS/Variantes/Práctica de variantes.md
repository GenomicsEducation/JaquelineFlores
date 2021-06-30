# **Introducción al llamado de variantes de secuencias NGS**  
Uno de los principales usos de la secuenciación de próxima generación es descubrir variantes genéticas o mutaciones entre individuos que pertenecen a diferentes poblaciones (Danecek et al., 2011). Con este fin, se han desarrollado tuberías que incluyen el procesamiento de grandes volúmenes de datos como el proyecto internacional [1000 genomas humanos](https://www.internationalgenome.org/), o el [proyecto chileno](http://www.1000genomas.cl/) de 1000 genomas que pretende secuenciar e identificar varianes en 1000 personas y en algunas especies endémicas de interes.  

Uno de los softwares más empleados para realizar esta tarea denominada “llamado de variantes”, es [GATK](https://gatk.broadinstitute.org/hc/en-us), que se comprende como un kit de herramientas de análisis de genomas desarrollado por el Broad Institute de los Estados Unidos, que tiene la capacidad de realizar gran parte del análisis requerido para llamar variantes genómicas (Deatherage, 2020).  

El presente trabajo tiene por objeto realizar el llamado de variantes y la anotación de una muestra secuenciada mediante el uso de GATK, Linux, vcftools y otras herramientas de anotación y visualización de la región blanco.  

Formato VCF
![VCF](https://user-images.githubusercontent.com/80992964/123888195-93f9db80-d918-11eb-9b15-3527101d259e.png)
Estructura formato VCF, tomado de: https://www.slideshare.net/AmazonWebServices/dat311-largescale-genomic-analysis-with-amazon-redshift  

_NOTA: Los scripts empleados en la presente práctica podrá encontrarlos en la carpeta [Scripts_variantes]() ubicada dentro del directorio [Variantes](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Variantes)._  


## **Conectar a servidor**
