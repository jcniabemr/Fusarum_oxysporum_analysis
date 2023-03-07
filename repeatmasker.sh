#!/usr/bin/env bash 
#SBATCH -p long 
#SBATCH -J bash 
#SBATCH --mem=10G
#SBATCH --cpus-per-task=4

source activate repeatmasker 

infile=$1
outdir=$2

workdir=/mnt/shared/scratch/jconnell/${SLURM_JOB_USER}_${SLURM_JOBID}
mkdir -p $workdir
name=$(basename $infile .fasta)
cp $infile $workdir/"$name"
cd $workdir

RepeatMasker \
-gff \
-pa 4 \
$name

mv "$name".cat.gz "$name"_masked.fasta.cat.gz
mv "$name".masked "$name"_masked.fasta
mv "$name".out "$name"_masked.out
mv "$name".tbl "$name"_masked.tbl
mv "$name".out.gff "$name"_masked.gff

a=$(ls | grep "masked")
for x in $a; do 
	cp $x $outdir
done 

rm -r $workdir