#!/usr/bin/env bash
#SBATCH -J kallisto 
#SBATCH -p short 
#SBATCH --mem=20G
#SBATCH --cpus-per-task=4

#####Script to create kallisto index then pseudoalign and count transcipts 

source miniconda3/bin/activate kallisto 

transcriptome=$1
fread=$2
rread=$3
outdir=$4
fasta=$(basename $transcriptome .fasta)

workdir=/mnt/shared/scratch/jconnell/kallisto_JOB_${SLURM_JOBID}
mkdir -p $workdir
cp -r $transcriptome $fread $rread $workdir
cd $workdir

kallisto index \
-k 31 \
-i "$fasta".idx \
$transcriptome	 

kallisto quant \
--index "$fasta".idx \
--output-dir $outdir \
$fread \
$rread	

rm -r $workdir	