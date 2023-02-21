#!/usr/bin/env bash
#SBATCH -J codingquarry
#SBATCH --partition=medium
#SBATCH --mem=100G
#SBATCH --cpus-per-task=10

source activate codingquarry

set -u
set -e

WorkDir=/home/jconnell/projects/niab/fusarium/${SLURM_JOB_USER}_${SLURM_JOBID}
mkdir -p $WorkDir
cd $WorkDir

Assembly=$1
GTF=$2
OutDir=$3
Threads=1

cuff_to_cq=/home/jconnell/miniconda3/envs/python_py27/bin/CufflinksGTF_to_CodingQuarryGFF3.py
$cuff_to_cq $GTF > transcripts.gff3
cp $Assembly assembly.fa

/home/jconnell/git_repos/niab_repos/fusarium/run_CQ-PM_stranded.sh assembly.fa transcripts.gff3 $Threads 2>&1 | tee codingquaryPM_log.txt

mkdir -p $OutDir/out
mv codingquaryPM_log.txt $OutDir
mv Secretome.txt $OutDir
mv out/* $OutDir/out/.
#rm -r $WorkDir



