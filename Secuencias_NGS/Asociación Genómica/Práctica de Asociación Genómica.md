# **Introducción a los Estudios de Asociación Genómica**  
El contenido de la presente práctica fue elaborado por: _Dr. José A. Gallardo_.  

A continuación encontrarás una breve guía de la práctica realizada, y una descripción simple de los resultados que podrás observar, pero para un seguimiento de la práctica completa podrás encontrar en la carpeta [Asociación Genómica](), el archivo [GWAS y Selección Genómica.Rmd](), que contiene el script y notas para guiarte en la práctica en Rstudio, y el cual podrás cargar en Rstudio cloud. También encontrarás la carpeta [GWAS Rstudio](), que contiene los archivos empleados en Rstudio._  


# **Notas importantes**  
## **Librerías R**  
Para realizar esta práctica se usarán las siguientes librerías de R:  
`utils`: Utilizada para importar big data usando la función read.delim().  
`rrBLUP`: Software for genomic prediction with the RR-BLUP mixed model (Endelman 2011).  
`ggplot2`: Para realizar gráficas avanzadas de regresión lineal.  

## **Simulación de datos**  
En el caso de esta práctica los datos fueron previamente simulados de la siguiente manera:  
_Genotipos geno_= Set de datos de genotipo con 200 animales endogámicos con 1000 SNP distribuidos en 10 cromosomas.  
_geno_inbred_= Set de datos de genotipo con 200 animales no endogámicos con 1000 SNP distribuidos en 10 cromosomas.  
_Fenotipos pheno_= Set de datos con variable cuantitativa continua y, con promedio 0 y varianza 5.  
_QTL_ y _heredabilidad_ del rasgo pheno 1 QTLs: 10, 1 por cromosoma.  
_heredabilidad_= 0.5  


# **Práctica Estudios de Asociación Genómica**  
## **Conectar a Rstudio cloud**  
Deberás ingresar a tu cuenta de Rstudio cloud, con tu usuario y contraseña.  

## **Importar y explorar archivo de genotipos y fenotipos**  
1. Importe los datos "geno" y "pheno": Importe el archivo de genotipos "geno.txt" y fenotipos "pheno.txt" usando la función `read.delim`.  
_Nota: podrás encontrar estos archivos en la carpeta [GWAS Rstudio]().  

2. Explorar datos: Luego realice un análisis exploratorio de ambos set de datos con las funciones `head()`, `dim()`. También realice un histograma de la variable cuantitativa y del archivo pheno, use la función `hist()`.  

_Nota: La codificación del homocigoto del alelo menor, del heterocigoto y del homocigoto del alelo mayor corresponde respetivamente a -1, 0 y 1._  

3. Investiga el uso de la función `A.mat` de la librería _rrBLUP_ y calcula la matriz de parentesco genómico para el set de datos geno. Explora la matriz con las funciones `dim()`, `head()` y `hist()`.  

4. A continuación deberás crear un objeto llamado endogamia con la diagonal de la matriz y grafiqar con `hist()`. Dado que la diagonal contiene el parentesco del individuo con sigo mismo (E(diagonal)= 1+f), según Endelman and Jannink, 2012 esto permite estimar el coeficiente de endogamia de la población.  

5. Investiga el uso de la función `GWAS()` de la librería _rrBLUP_ y realiza un análisis de asociación genómica GWAS. Incluye el argumento plot=TRUE, y almacena el resultado del GWAS en un objeto denominado "score".  

## **QTLs**  
Ahora exploraremos el efecto de los QTLs detectados por el GWAS.  
1. Explora el objeto score con el comando `head()` y `View()`.  

2. Extrae el score de los SNP significativos (score>5) usando la función `filter()` de la librería _dplyr_.  

3. Para identificar el nivel de significancia de los QTLs, note que el score corresponde a -log(p), donde p es la probabilidad o significancia, transforme el score a p usando `exp()`.  

4. Realice un gráfico de regresión lineal de fenotipo en función de los genotipo para cada SNP significativo. _Sugerencia: Transponga la matriz geno y cree un nuevo data.frame solo con los snp signiticativos, luego una al data.frame el rasgo cuantitativo._  

5. Estima el efecto (beta o pendiente) de los QTLs con mayor score usando un modelo lineal `lm()`.  
