#!/usr/bin/env bash
#SBATCH -J cufflinks
#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --cpus-per-task=4

AcceptedHits=$1
OutDir=$2

cufflinks=/home/jconnell/projects/niab/fusarium/software/cufflinks/cufflinks-2.2.1.Linux_x86_64/cufflinks
WorkDir=/mnt/shared/scratch/jconnell/cufflinks_${SLURM_JOBID}

mkdir -p $WorkDir/out
cd $WorkDir
cp $AcceptedHits accepted_hits.bam

$cufflinks -o out -p 16 --max-intron-length 4000 accepted_hits.bam 2>&1 | tee out/cufflinks.log

rm accepted_hits.bam
cp -r $WorkDir/out/* $OutDir
rm -r $WorkDir

