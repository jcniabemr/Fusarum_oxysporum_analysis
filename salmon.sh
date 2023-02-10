#!/usr/bin/env bash
#SBATCH -J salmon
#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --cpus-per-task=4


#Usage  <Transcriptome.fa> <Read_F.fq> <Read_R.fq> <OutputFi

Transcriptome=$1
ReadF=$2
ReadR=$3
OutDir=$4
index=$5


WorkDir=/mnt/shared/scratch/jconnell/salmon_${SLURM_JOB_USER}_${SLURM_JOBID}
mkdir -p $WorkDir


cp $Transcriptome $WorkDir
cp $ReadF $WorkDir
cp $ReadR $WorkDir
cp -r $index $WorkDir   
cd $WorkDir

####Create transciptome index
salmon index -t $Transcriptome -i transcripts_index --keepDuplicates -k 27

####Run Salmon 
salmon quant \
    -i transcripts_index \
    -l A \
    -1 $ReadF \
    -2 $ReadR \
    --validateMappings \
    -p 4 \
    --numBootstraps 1000 \
    --dumpEq \
    --seqBias \
    --gcBias \
    -o transcripts_quant


####Copy files 
cp -r transcripts_quant/* $OutDir
#rm -r $WorkDir




