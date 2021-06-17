#!/bin/bash
 #SBATCH - J fdump_usuario
 /home2/usuario/sratoolkit.2.11.0-centos_linux64/bin/fasterq-dump /home2/usuario/SRA_samples/SRR2006763/*.sra -O /home2/usuario/SRA_samples/SRR2006763/
