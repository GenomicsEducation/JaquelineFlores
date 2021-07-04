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
**PLINK** es un conjunto de herramientas de análisis de asociación de genoma completo de código abierto y gratuito, diseñado para realizar una variedad de análisis genéticos básicos a gran escala, de forma eficiente (https://www.cog-genomics.org/plink2).  

![PLINK](https://user-images.githubusercontent.com/80992964/124394740-5dc8ad00-dcc6-11eb-9a22-62ef0678aabf.png)  

**ADMIXTURE** es un software empleado para estimar la máxima probabilidad de ancestría individual, e inferir poblaciones a partir de un conjunto de datos de genotipos de múltiples SNP. Utiliza el mismo modelo estadístico que el software STRUCTURE pero el algoritmo de optimización numérico que utiliza realiza estimaciones con mayor rapidez (https://bioinformaticshome.com/tools/descriptions/ADMIXTURE.html).


## **Para trabajar en Rstudio**  
## **LIBRERIAS R**  
Para elaborar algunas gráficas se usarán las siguientes librerías de R: "ggplot2", "readr", "dplyr", "tidyverse" o "tidyr", y "cowplot".  

