#!/usr/bin/env bash
#SBATCH -J braker
#SBATCH --partition=long
#SBATCH --mem-per-cpu=6G
#SBATCH --cpus-per-task=14

#export PATH="$PATH:/home/jconnell/miniconda3/pkgs/blast-2.12.0-pl5262h3289130_0/bin"
#export PATH="$PATH:/home/jconnell/miniconda3/pkgs/diamond-0.9.14-h2e03b76_4/bin"
export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/hdf5/bin"
export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/hal/hal/bin"
#export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/samtools/bin/"
#export PATH="/mnt/shared/scratch/jconnell/apps/Augustus/bin:/mnt/shared/scratch/jconnell/apps/Augustus/scripts":$PATH
#export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/GUSHR/GUSHR"
export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/USCS_tools/"
#export PATH="$PATH://mnt/shared/scratch/jconnell/apps/genemark/gmes_linux_64"
#export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/ProtHint/ProtHint-2.6.0/bin"
#export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/BRAKER/BRAKER_7Jan2022/scripts"
#export AUGUSTUS_SCRIPTS_PATH="$AUGUSTUS_SCRIPTS_PATH:/mnt/shared/scratch/jconnell/apps/Augustus/scripts"
#export AUGUSTUS_CONFIG_PATH="$AUGUSTUS_CONFIG_PATH:/mnt/shared/scratch/jconnell/apps/Augustus/config"



WorkDir=/mnt/shared/scratch/jconnell/braker_${SLURM_JOB_USER}_${SLURM_JOBID}
Assembly=$1
OutDir=$2
AcceptedHits=$3
CurDir=$PWD

mkdir -p $WorkDir
cp $CurDir/$Assembly $WorkDir/assembly.fa
cp $CurDir/$AcceptedHits $WorkDir/alignedRNA.bam

cd $WorkDir



#braker=/mnt/shared/scratch/jconnell/apps/BRAKER/BRAKER_7Jan2022/scripts/braker.pl
braker=/mnt/shared/scratch/jconnell/apps/BRAKER/BRAKER-2.1.6/scripts/braker.pl


$braker \
  --AUGUSTUS_CONFIG_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/config \
  --AUGUSTUS_BIN_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/bin \
  --AUGUSTUS_SCRIPTS_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/scripts \
  --BAMTOOLS_PATH=/mnt/shared/scratch/jconnell/apps/bamtools/bin \
  --GENEMARK_PATH=/mnt/shared/scratch/jconnell/genemark/gmes_linux_64_4 \
  --SAMTOOLS_PATH=/mnt/shared/scratch/jconnell/apps/samtools/bin \
  --PROTHINT_PATH=/mnt/shared/scratch/jconnell/apps/ProtHint/ProtHint-2.6.0/bin \
  --ALIGNMENT_TOOL_PATH=/home/jconnell/miniconda3/pkgs/spaln-2.4.7-pl5262h9a82719_0/bin \
  --DIAMOND_PATH=/home/jconnell/miniconda3/pkgs/diamond-0.9.14-h2e03b76_4/bin \
  --BLAST_PATH=/home/jconnell/miniconda3/envs/BRAKER_env/bin \
  --PYTHON3_PATH=/home/jconnell/miniconda3/envs/BRAKER_env/bin \
  --JAVA_PATH=/home/jconnell/miniconda3/bin \
  --GUSHR_PATH=/mnt/shared/scratch/jconnell/apps/GUSHR/GUSHR \
  --MAKEHUB_PATH=/home/jconnell/miniconda3/pkgs/makehub-1.0.5-1/bin \
  --CDBTOOLS_PATH=/home/jconnell/miniconda3/envs/BRAKER_env/bin \
  --overwrite \
  --fungus \
  --gff3 \
  --softmasking on \
  --species=AJ516_2022_Fusarium_rna_att2 \
  --genome="assembly.fa" \
  --bam="alignedRNA.bam" \
  --extrinsicCfgFile=/mnt/shared/scratch/jconnell/apps/Augustus/config/extrinsic/rnaseq.cfg \
  --min_contig=10000

#mkdir -p $CurDir/$OutDir
#cp -r braker/* $OutDir

#rm -r $WorkDir