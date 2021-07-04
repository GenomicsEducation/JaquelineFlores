# **Introducción a la Genómica Poblacional y Ancestría**  
El contenido de la presente práctica fue elaborado por: _Dr. José A. Gallardo_ y _Nicol Delgado_.  

Para el mejor entendimiento de la práctica y las actividades realizadas, te dejo aquí información de utilidad que a mi también me fue proporcionada para realizar la presente práctica.  

En esta práctica trabajaras de forma simultanea en PuTTy y Rstudio, por lo que encontrarás aquí notas para la preparación de ambas herramientas.  

_Nota: Todos los archivos descargados y visualizados en Rstudio, así como los códigos empleados para la generación de los gráficos aquí descritos, se encuentran en la carpeta [](). El archivo []() contiene los códigos y la carpeta []() los archivos empleados para visualización.  

# **Notas importantes**  
## **Origen de las muestras**  
El archivo vcf contiene muestras provenientes de tres poblaciones domesticadas de salmón del Atlántico (_Salmo salar_) provenientes de Europa, Oceania y Norteamérica.

## **Etapas del analisis poblacional**  
1. Descarga del archivo vcf.  
2. Estimación de algunas medidas comúnes de diversidad genética.  
3. Transformación del archivo vcf a formato plink.  
4. Transformación del archivo plink a formato plink binario.  
5. Filtrado por equilibrio de Hardy-Weinberg, frecuencia del alelo menor, desequilibrio de ligamiento e individuos emparentados.  
6. Análisis y detección de estructura poblacional con PLINK o ADMIXTURE.  
7. Visualización de la subestructura de la población mediante gráficas realizadas en R.  

## **Para trabajar en PuTTy**  
## **Softwares bioinformáticos**  
[**PLINK**](https://www.cog-genomics.org/plink2) es un conjunto de herramientas de análisis de asociación de genoma completo de código abierto y gratuito, diseñado para realizar una variedad de análisis genéticos básicos a gran escala, de forma eficiente.  

![PLINK](https://user-images.githubusercontent.com/80992964/124394740-5dc8ad00-dcc6-11eb-9a22-62ef0678aabf.png)  

[**ADMIXTURE**](https://bioinformaticshome.com/tools/descriptions/ADMIXTURE.html) es un software empleado para estimar la máxima probabilidad de ancestría individual, e inferir poblaciones a partir de un conjunto de datos de genotipos de múltiples SNP. Utiliza el mismo modelo estadístico que el software STRUCTURE pero el algoritmo de optimización numérico que utiliza realiza estimaciones con mayor rapidez.


## **Para trabajar en Rstudio**  
## **LIBRERIAS R**  
Para elaborar algunas gráficas se usarán las siguientes librerías de R: "ggplot2", "readr", "dplyr", "tidyverse" o "tidyr", y "cowplot".  


# **Práctica Genómica Poblacional y Ancestría**   
## **Conectar a servidor**  
Conectaremos al servidor de interés utilizando la dirección IP y puerto correspondientes (en este caso conectaremos a POMEO con los datos: IP 200.54.220.141, puerto 22), mediante el software PuTTy y nuestra clave de acceso.  

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

## **Análisis de diversidad**  
Estimar el numero de sitios heterocigotos para cada individuo y la heterocigosidad observada y esperada para cada marcador. Utilice `ls`, `-l`, `head`, `cat`, `less`, etc., segun corresponda, para explorar los archivos de salida de cada uno de estos analisis.  

**Calcular la diversidad en una ventana no superpuesta de 200 kb para cada individuo.**  
_**Para la población de Europa**_  
_**Para la población de Oceania**_  
_**Para la población de Norteamérica**_  

**Calcular el desequilibrio de ligamiento (LD).**  
_**Para la población de Europa**_  
_**Para la población de Oceania**_  
_**Para la población de Norteamérica**_  

**Gráficos de Heterogocidad individual, Diversidad de nucleótidos y Desequilibrio de ligamiento (LD), y Gráfico de paneles múltiples.**  


## **Análisis de estructura poblacional**  
**Gráficos de PCA.**  


## **Análisis de admixture**  
**Gráficos de ADMIXTURE para 2, 4 y 6 poblaciones.**
