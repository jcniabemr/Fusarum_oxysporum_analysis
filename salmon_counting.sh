#!/usr/bin/env bash
#SBATCH -p medium
#SABTCH -J RNA_seq_analysis
#SBATCH --mem=2G
#SBATCH --cpus-per-task=4

for strain in $(ls /home/jconnell/fusarium/rna_seq_data/lettuce_alignment | grep "AJ516"); do
Transcriptome=/home/jconnell/fusarium/rna_seq_data/re_annotation/AJ516_2022/final_annotations/mk2/remove_dup_features/final_genes_appended_renamed.cds.fasta
    for RawData in /home/jconnell/fusarium/rna_seq_data/decontaminated/AJ516/$strain; do
        FileF=$RawData/F/*cleaned.fq.gz
        FileR=$RawData/R/*cleaned.fq.gz
        echo $FileF
        echo $FileR
        OutDir=/home/jconnell/fusarium/salmon/$strain
        mkdir -p $OutDir
        ProgDir=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum
        sbatch $ProgDir/salmon.sh $Transcriptome $FileF $FileR $OutDir
    done
done
