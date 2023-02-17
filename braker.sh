#!/usr/bin/env bash
#SBATCH -J braker
#SBATCH --partition=long
#SBATCH --mem-per-cpu=6G
#SBATCH --cpus-per-task=14

source miniconda3/bin/activate BRAKER_env

export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/hdf5/bin"
export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/hal/hal/bin"
export PATH="$PATH:/mnt/shared/scratch/jconnell/apps/USCS_tools/"

WorkDir=/mnt/shared/scratch/jconnell/braker_${SLURM_JOB_USER}_${SLURM_JOBID}
Assembly=$1
OutDir=$2
AcceptedHits=$3
gene_name=$4
CurDir=$PWD

mkdir -p $WorkDir
cp $Assembly $WorkDir/assembly.fa
cp $AcceptedHits $WorkDir/alignedRNA.bam
cd $WorkDir

braker=/mnt/shared/scratch/jconnell/apps/BRAKER/BRAKER-2.1.6/scripts/braker.pl
$braker \
  --AUGUSTUS_CONFIG_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/config \
  --AUGUSTUS_BIN_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/bin \
  --AUGUSTUS_SCRIPTS_PATH=/mnt/shared/scratch/jconnell/apps/Augustus/scripts \
  --BAMTOOLS_PATH=/mnt/shared/scratch/jconnell/apps/bamtools/bin \
  --GENEMARK_PATH=/home/jconnell/projects/niab/fusarium/software/genemark/gmes_linux_64 \
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
  --species=$gene_name \
  --genome="assembly.fa" \
  --bam="alignedRNA.bam" \
  --extrinsicCfgFile=/mnt/shared/scratch/jconnell/apps/Augustus/config/extrinsic/rnaseq.cfg \
  --min_contig=10000

cp -r braker/* $OutDir
rm -r $WorkDir