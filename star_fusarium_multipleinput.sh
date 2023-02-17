#!/usr/bin/env bash
#SBATCH -J STAR
#SBATCH --partition=long
#SBATCH --mem=100G
#SBATCH --cpus-per-task=12

#Align RNAseq data with genome using STAR

source  miniconda3/bin/activate star 

InGenome=$1
InRead1F=$2
InRead1R=$3
InRead2F=$4
InRead2R=$5
InRead3F=$6
InRead3R=$7
InRead4F=$8
InRead4R=$9
InRead5F=${10}
InRead5R=${11}
InRead6F=${12}
InRead6R=${13} 
InRead7F=${14}
InRead7R=${15}
InRead8F=${16}
InRead8R=${17}
InRead9F=${18}
InRead9R=${19}
OutDir=${20}
Preindex=${21}
name=${22}

WorkDir=/mnt/shared/scratch/jconnell/star_${SLURM_JOBID}
mkdir -p $WorkDir

cp $InGenome $WorkDir	
cp $InRead1F $WorkDir	
cp $InRead1R $WorkDir	
cp $InRead2F $WorkDir
cp $InRead2R $WorkDir
cp $InRead3F $WorkDir
cp $InRead3R $WorkDir
cp $InRead4F $WorkDir
cp $InRead4R $WorkDir
cp $InRead5F $WorkDir
cp $InRead5R $WorkDir
cp $InRead6F $WorkDir
cp $InRead6R $WorkDir
cp $InRead7F $WorkDir
cp $InRead7R $WorkDir
cp $InRead8F $WorkDir
cp $InRead8R $WorkDir
cp $InRead9F $WorkDir
cp $InRead9R $WorkDir
cd $WorkDir

GenomeDir=$WorkDir/index
#export PATH=/home/jconnell/miniconda3/pkgs/star-2.7.10a-h9ee0642_0/bin:$PATH
STAR \
--runMode genomeGenerate \
--genomeSAindexNbases $Preindex \
--genomeDir $GenomeDir \
--genomeFastaFiles $InGenome \
--runThreadN 16

STAR \
--winAnchorMultimapNmax 200 \
--outSAMstrandField intronMotif \
--genomeDir $GenomeDir \
--outFileNamePrefix "$name"_aligment \
--readFilesIn $InRead1F,$InRead2F,$InRead3F,$InRead4F,$InRead5F,$InRead6F,$InRead7F,$InRead8F,$InRead9F $InRead1R,$InRead2R,$InRead3R,$InRead4R,$InRead5R,$InRead6R,$InRead7R,$InRead8R,$InRead9R \
--readFilesCommand gunzip -c \
--seedSearchStartLmax 30 \
--outReadsUnmapped Fastx \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 180000000000 \
--runThreadN 16

cp -r "$name"_* $OutDir
rm -r $WorkDir