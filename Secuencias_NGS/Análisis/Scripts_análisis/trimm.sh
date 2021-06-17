#!/bin/bash
#SBATCH - J trimm_usuario
trimmomatic PE SRR2006763_1.fastq SRR2006763_2.fastq -baseout SRR20067634_filtered.fastq.gz SLIDINGWINDOW:5:25 MINLEN:60
