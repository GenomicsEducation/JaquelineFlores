# **Introducción a la Genómica Poblacional y Ancestría**  
El contenido de la presente práctica fue elaborado por: _Dr. José A. Gallardo_ y _Nicol Delgado_.  

Para el mejor entendimiento de la práctica y las actividades realizadas, te dejo aquí información de utilidad que a mi también me fue proporcionada para realizar la presente práctica.  

En esta práctica trabajaras de forma simultánea en PuTTy y Rstudio, por lo que encontrarás aquí notas para la preparación de ambas herramientas.  

_Nota: Todos los archivos descargados y visualizados en Rstudio, así como los códigos empleados para la generación de los gráficos aquí descritos, se encuentran en la carpeta [Genómica Poblacional y Ancestría](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa). El archivo [Genómica_Poblacional.Rmd](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa/Gen%C3%B3mica_Poblacional.Rmd) contiene los códigos y la carpeta [Population](https://github.com/GenomicsEducation/JaquelineFlores/tree/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa/Population) los archivos empleados para visualización._  

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
![POMEO](https://user-images.githubusercontent.com/80992964/124395563-6f13b880-dcca-11eb-9f2a-71406dee4ccd.png)  

## **Rstudio**  
Si tienes acceso a [Rstudio server](https://www.rstudio.com/products/rstudio/), completamente actualizado y compatible con nuevos paquetes o librerías, podrás conectarte directamente, y ahí verás en tiempo real los archivos que irás creando en el servidor a través de PuTTy, y podrás trabajar con ellos para obtener los gráficos que se mencionan en esta práctica. Ahora bien, si el servidor de Rstudio no esta actualizado o es muy viejo, esto puede causarte errores en la codificación que aquí se mostrará y quizá no obtengas los gráficos deseados, si este es tu caso podrás emplear una cuenta en [Rstudio cloud](https://rstudio.cloud/), si ya cuentas con ella ¡perfecto!, si no cuentas con una crearla es muy simple y no te tomará mucho tiempo.
Una vez que tengas claro en dónde trabajaras, deberás ingresar a tu cuenta, iniciar un nuevo proyecto y abrir un archivo ".rmd"/R markdown, en el que descargarás las librerías indicadas en la sección de arriba.  

_Nota: Si decides trabajar en Rstudio cloud deberás descargar todos los archivos de Rstudio server y cargarlos en Rstudio cloud para poder emplearlos._  
![Rstudio](https://user-images.githubusercontent.com/80992964/124395681-07aa3880-dccb-11eb-88dd-9e615dab2310.png)  


## **Configurar bioconda e instalar programas para análisis**  
1. Para configurar el canal bioconda se debe ejecutar el siguiente comando: `conda config --add channels bioconda`  
   _Al realizar la ejecución simplemente aparecera de nuevo la línea para escribir comandos, en mi caso aparece un mensaje que indica que ya tengo bioconda en mi lista de canales._  
2. Para la instalación del software plink: `conda install -c bioconda plink`  
  _Se realizará la instalación del software, recordar que en un punto pedirá indicar "y" o "yes" para continuar con la instalación._  
3. Para la instalación del software admixture: `conda install -c bioconda admixture`  

_NOTA: Recuerda que cuando ha terminado de ejecutarse algún comando aparecerá de nuevo la línea (base) dónde te encuentras trabajando, y aparecerá el cuadro de color que te indica que puedes escribir, esa es la señal de que se ha terminado de ejecutar un comando y que puedes continuar trabajando._  
![CONFIG](https://user-images.githubusercontent.com/80992964/124478558-ed279c00-dd6a-11eb-963f-e29eaa8889d5.png)  


## **Creación de directorio**  
Para el caso de esta práctica el directorio y los archivos necesarios para ejecutar esta práctica ya habían sido creados e instalados en mi directorio personal, por lo que solo era necesario ingresar a el y explorar los archivos de trabajo. Usted deberá crear el directorio y para ello dejo las indicaciones completas.
1. Crear una carpeta denominada "variant_call" en tu usuario de home2: `mkdir population`  
2. Ingresar a la carpeta: `cd population`  
3. Explorar el contenido de la carpeta: `ls -l -h`  

_Nota: El directorio "population" contiene los siguientes archivos necesarios para efectuar el análisis poblacional con plink y admixture._  

**1. EU_OC_US.vcf:** Archivo vcf que contiene las muestras provenientes de tres poblaciones de salmón del Atlántico (_Salmo salar_).  
**1.1. Europa:** 2_WG0341511-DNA_A02_5408, 3_WG0341511-DNA_A03_5416, 5_WG0341511-DNA_A05_5450._  
**1.2. Oceania:** FR07958834, FR07958842, FR07958850.  
**1.3. Norteamérica:** GNB12-1, GNB12-10, GNB12-11.  
**2. Contiene un Script para realizar los diagramas de admixture.**  
**2.1. Admixture_plot.R:** Script que contiene el codigo para crear una función llamada admixtureplot(), utilizada para realizar los diagramas de admixture.  
![DIR](https://user-images.githubusercontent.com/80992964/124479605-0ed55300-dd6c-11eb-8d75-934d0bfd6f77.png)  


## **Análisis de diversidad**  
A continuación, estimaremos el número de sitios heterocigotos para cada individuo y la heterocigosidad observada y esperada para cada marcador. Utilice `ls`, `-l`, `head`, `cat`, `less`, etc., segun corresponda, para explorar los archivos de salida de cada uno de estos analisis.  
1. Número de heterocigotos: `vcftools --vcf EU_OC_US.vcf --het --out EU_OC_US`  
2. Número de heterocigosidad: `vcftools --vcf EU_OC_US.vcf --hardy --out EU_OC_US`  
![DIVER](https://user-images.githubusercontent.com/80992964/124483491-04b55380-dd70-11eb-8aeb-165153fd8168.png)  


## **Calcular la diversidad en una ventana no superpuesta de 200 kb para cada individuo.**  
_**Para la población de Europa**_: `vcftools --vcf EU_OC_US.vcf --window-pi 200000 --indv 2_WG0341511-DNA_A02_5408 --indv 3_WG0341511-DNA_A03_5416 --indv 5_WG0341511-DNA_A05_5450 --out EU`  
![EUROPA](https://user-images.githubusercontent.com/80992964/124483722-47772b80-dd70-11eb-9945-ecabff1475bc.png)  

_**Para la población de Oceania**_: `vcftools --vcf EU_OC_US.vcf --window-pi 200000 --indv FR07958834 --indv FR07958842 --indv FR07958850 --out OC`  
![OCEANIA](https://user-images.githubusercontent.com/80992964/124483919-7ab9ba80-dd70-11eb-94a1-dc08e4a46f0b.png)  

_**Para la población de Norteamérica**_: `vcftools --vcf EU_OC_US.vcf --window-pi 200000 --indv GNB12-1 --indv GNB12-10 --indv GNB12-11 --out US`  
![NORTH](https://user-images.githubusercontent.com/80992964/124484061-a2a91e00-dd70-11eb-9a6d-e0db10f83cd0.png)  


## **Calcular el desequilibrio de ligamiento (LD).**  
_**Para la población de Europa**_: `vcftools --vcf EU_OC_US.vcf --geno-r2 --chr 1 --ld-window-bp 100000 --min-r2 0.001 --indv 2_WG0341511-DNA_A02_5408 --indv 3_WG0341511-DNA_A03_5416 --indv 5_WG0341511-DNA_A05_5450 --out EU`  
![EUROPA2](https://user-images.githubusercontent.com/80992964/124484265-d8e69d80-dd70-11eb-82b6-e40a3bd135e2.png)  

_**Para la población de Oceania**_: `vcftools --vcf EU_OC_US.vcf --geno-r2 --chr 1 --ld-window-bp 100000 --min-r2 0.001 --indv FR07958834 --indv FR07958842 --indv FR07958850 --out OC`  
![OCEANIA2](https://user-images.githubusercontent.com/80992964/124484299-e2700580-dd70-11eb-85f1-f298791db584.png)  

_**Para la población de Norteamérica**_: `vcftools --vcf EU_OC_US.vcf --geno-r2 --chr 1 --ld-window-bp 100000 --min-r2 0.001 --indv GNB12-1 --indv GNB12-10 --indv GNB12-11 --out US`  
![NORTH2](https://user-images.githubusercontent.com/80992964/124484344-eef45e00-dd70-11eb-9ff5-6eeb368ddfec.png)  

_Nota: Si ejecutas un `ls` al terminar de ejecutar los comandos anteriores podrás corroborar que se han generados varios documentos adicionales._
![LS](https://user-images.githubusercontent.com/80992964/124485019-c15be480-dd71-11eb-8c63-d5cf60bc17b4.png)  


## **Gráficos de Heterogocidad individual, Diversidad de nucleótidos y Desequilibrio de ligamiento (LD), y Gráfico de paneles múltiples.**  
Para realizar los gráficos y tablas aquí mostrados deberás ingresar a Rstudio, a continuación revisa el archivo [Genómica_Poblacional.Rmd](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa/Gen%C3%B3mica_Poblacional.Rmd), en el cual podrás encontrar los códigos necesarios para generarlos.  

**1. Heterogocidad individual.**  
![HETERO](https://user-images.githubusercontent.com/80992964/124485320-0e3fbb00-dd72-11eb-98ac-a33fdde9ffcc.png)  

**2. Diversidad de nucleótidos.**  
![DIVERS](https://user-images.githubusercontent.com/80992964/124485803-90c87a80-dd72-11eb-8b63-34db1a436144.png)  

**3. Desequilibrio de ligamiento (LD).**  
![DESEQ](https://user-images.githubusercontent.com/80992964/124485989-bc4b6500-dd72-11eb-80ed-f31df4545ac0.png)  

**4. Paneles múltiples.**  
![PANELES](https://user-images.githubusercontent.com/80992964/124486157-eb61d680-dd72-11eb-8577-af39a1fa4b67.png)  


## **Análisis de estructura poblacional**  
1. Para generar el archivo de entrada en formato plink: `plink --vcf EU_OC_US.vcf --recode --out EU_OC_US --double-id --allow-extra-chr --chr-set 29`  
![plink](https://user-images.githubusercontent.com/80992964/124510520-9b4a3a80-dd99-11eb-9d99-6ad0114d3a67.png)  

2. Para generar el archivo de entrada en formato plink binario: `plink --file EU_OC_US --make-bed --out EU_OC_US --allow-extra-chr --chr-set 29`  
![plinkbin](https://user-images.githubusercontent.com/80992964/124510638-e2d0c680-dd99-11eb-9948-f148336c70de.png)  

3. Para filtrar basado en equilibrio de Hardy-Weinberg y frecuencia del alelo menor: `plink --bfile EU_OC_US --hwe 0.01 --maf 0.05 --make-bed --out EU_OC_US.Filtered --allow-extra-chr --chr-set 29`  
![HW](https://user-images.githubusercontent.com/80992964/124510771-2cb9ac80-dd9a-11eb-9312-44940a00173e.png)  

4. Para filtrar y excluir marcadores por desequilibrio de ligamiento:  
4.1. `plink --bfile EU_OC_US.Filtered --indep-pairwise 50 10 0.05 --make-bed --out EU_OC_US.Filtered --allow-extra-chr --chr-set 29`  
4.2. `plink --bfile EU_OC_US.Filtered --extract EU_OC_US.Filtered.prune.in --make-bed --out EU_OC_US.FilteredPruned --allow-extra-chr --chr-set 29`  
![DL](https://user-images.githubusercontent.com/80992964/124511168-17914d80-dd9b-11eb-9f16-ff4f2d60b08b.png)  

5. Para filtrar y remover individuos relacionados:  
5.1. `plink --bfile EU_OC_US.FilteredPruned --rel-cutoff 0.4 --out EU_OC_US.FilteredPruned --allow-extra-chr --chr-set 29`  
5.2. `plink --bfile EU_OC_US.FilteredPruned --keep EU_OC_US.FilteredPruned.rel.id --make-bed --out EU_OC_US.FilteredPrunedUnrel --allow-extra-chr --chr-set 29`  
![IndivRelac](https://user-images.githubusercontent.com/80992964/124511345-8373b600-dd9b-11eb-94f6-0785384d8477.png)  

6. Para PCA (Principal Component Analysis): `plink --bfile EU_OC_US.FilteredPrunedUnrel --pca 4 --out EU_OC_US.FilteredPrunedUnrel --allow-extra-chr --chr-set 29`  
![PCA](https://user-images.githubusercontent.com/80992964/124511984-f9c4e800-dd9c-11eb-8d0b-97bd3dc5fe16.png)  

**Gráficos de PCA.**  
Para realizar los gráficos y tablas aquí mostrados deberás ingresar a Rstudio, a continuación revisa el archivo [Genómica_Poblacional.Rmd](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa/Gen%C3%B3mica_Poblacional.Rmd), en el cual podrás encontrar los códigos necesarios para generarlos.  
![graphPCA](https://user-images.githubusercontent.com/80992964/124507314-2d027980-dd93-11eb-9d54-2f35117713a9.png)  


## **Análisis de admixture**  
1. Selección al azar del 1% de los marcadores: `plink --bfile EU_OC_US.FilteredPrunedUnrel --thin 0.01 --make-bed --out EU_OC_US.Thinned --allow-extra-chr --chr-set 29`  
![azar](https://user-images.githubusercontent.com/80992964/124512349-bcad2580-dd9d-11eb-8078-956116d17dd4.png)  

2. Análisis de ancestría de 2 a 6 poblaciones:
   `for K in` `seq 2 6;`
   `do`
   `admixture EU_OC_US.Thinned.bed $K;`
   `done`  
![ancestria](https://user-images.githubusercontent.com/80992964/124512401-e2d2c580-dd9d-11eb-9613-186ac55f516e.png)  

![ancestria1](https://user-images.githubusercontent.com/80992964/124512461-0b5abf80-dd9e-11eb-8bae-81adbf8e0e3e.png)  

![ancestria2](https://user-images.githubusercontent.com/80992964/124512484-1877ae80-dd9e-11eb-8334-9b37c77e372b.png)  

![ancestria3](https://user-images.githubusercontent.com/80992964/124512503-2299ad00-dd9e-11eb-8244-5bd6d8b682c7.png)  

![ancestria4](https://user-images.githubusercontent.com/80992964/124512526-3218f600-dd9e-11eb-896c-a6345ee79e06.png)


_Nota: ADMIXTURE genera 2 archivos: El archivo con extensión ".Q" contiene asignaciones de grupos para cada individuo; el ".P" contiene para cada SNP las frecuencias alélicas de la población._  


**Gráficos de ADMIXTURE para 2, 4 y 6 poblaciones.**  
Para realizar los gráficos y tablas aquí mostrados deberás ingresar a Rstudio, a continuación revisa el archivo [Genómica_Poblacional.Rmd](https://github.com/GenomicsEducation/JaquelineFlores/blob/main/Secuencias_NGS/Gen%C3%B3mica%20Poblacional%20y%20Ancestr%C3%ADa/Gen%C3%B3mica_Poblacional.Rmd), en el cual podrás encontrar los códigos necesarios para generarlos.  

![para2](https://user-images.githubusercontent.com/80992964/124508366-676d1600-dd95-11eb-9f84-5a793288f3c6.png)  

![para4](https://user-images.githubusercontent.com/80992964/124508324-51f7ec00-dd95-11eb-9123-c4512748ed77.png)  

![para6](https://user-images.githubusercontent.com/80992964/124508403-78b62280-dd95-11eb-82a6-6ffbee09ebff.png)
