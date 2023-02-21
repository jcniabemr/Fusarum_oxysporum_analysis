#!/usr/bin/env bash
#SBATCH -p medium
#SABTCH -J RNA_seq_analysis
#SBATCH --mem=2G
#SBATCH --cpus-per-task=4

####Kallisto count 
####Count reads for AJ516
for strain in $(ls /home/jconnell/fusarium/rna_seq_data/lettuce_alignment | grep "AJ520_4"); do
Transcriptome=/home/jconnell/fusarium/rna_seq_data/re_annotation/AJ520_2022/final_annotations/remove_dup_features/final_genes_appended_renamed.cds.fasta
    for RawData in /home/jconnell/fusarium/rna_seq_data/decontaminated/AJ520/$strain; do
        FileF=$RawData/F/*cleaned.fq.gz
        FileR=$RawData/R/*cleaned.fq.gz
        echo $FileF
        echo $FileR
        OutDir=/home/jconnell/fusarium/kallisto/$strain
        mkdir -p $OutDir
        ProgDir=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum
        sbatch $ProgDir/kallisto.sh $Transcriptome $FileF $FileR $OutDir
    done
done

####Count reads for Fo47
# for strain in $(ls /home/jconnell/fusarium/rna_seq_data/lettuce_alignment | grep "Fo47"); do
# Transcriptome=/home/jconnell/fusarium/complete_nanopore_genomes/Fo47_2022/Fo47_CDS.fasta
#     for RawData in /home/jconnell/fusarium/rna_seq_data/decontaminated/Fo47/$strain; do
#         FileF=$RawData/F/*cleaned.fq.gz
#         FileR=$RawData/R/*cleaned.fq.gz
#         echo $FileF
#         echo $FileR
#         OutDir=/home/jconnell/fusarium/kallisto/Fo47/$strain
#         mkdir -p $OutDir
#         ProgDir=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum
#         sbatch $ProgDir/kallisto.sh $Transcriptome $FileF $FileR $OutDir
#     done
# done
####TX2GENE 
#es Fo47_CDS.fasta | grep ">" | sed 's/>//g' | sort -n > trans_names
#for x in {1..17427} ; do echo $x | awk '{print "g"$0}' >> gene_names; done
####Find missing genes from transcript ID
#comm -12 trans_num gene_num | awk '{print "g"$0}'> new_gene_names
#paste trans_names new_gene_names > tx2gene.txt
