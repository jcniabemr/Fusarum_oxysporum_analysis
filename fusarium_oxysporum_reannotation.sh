#!/usr/bin/env bash 
#SBATCH -p long 
#SBATCH -J Fusarium_annotation
#SBATCH --mem=50G
#SBATCH --cpus-per-task=4


#Reannotate fusarium genomes with latest RNA seq



# race_1  PF1_2022
#         PF2_2022    
#         FYTO7211_2011
#		  AJ_520

# race_4  AJ516_2022
#         AJ592_2022
#         AJ705_2022



#copy and rename files

# c=$(ls -l /home/jconnell/niab/fusarium/rna_seq_data/decontaminated | awk '{print $9}')
# for i in $c; do 
# 	mkdir -p /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${i}
# 	cp /home/jconnell/niab/fusarium/rna_seq_data/decontaminated/${i}/F/star_aligmentUnmapped.out.mate1cleaned.fq.gz /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${i}/"$i"_RNA_unmapped_cleaned_F.fq.gz
# 	cp /home/jconnell/niab/fusarium/rna_seq_data/decontaminated/${i}/R/star_aligmentUnmapped.out.mate2cleaned.fq.gz /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${i}/"$i"_RNA_unmapped_cleaned_R.fq.gz
# done 


#Alignment of RNA-Seq data with genome using star 
##############################################################TEST

 # for Assembly in /home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ516_2022/AJ516_2022.fasta; do
 #    fileF=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/F/Folac_R4_1_trim.fq.gz    
 #    fileR=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/R/Folac_R4_2_trim.fq.gz
 #    add1f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_1M/AJ516_1M_RNA_unmapped_cleaned_F.fq.gz
 #    add1r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_1M/AJ516_1M_RNA_unmapped_cleaned_R.fq.gz
 #    add2f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_2M/AJ516_2M_RNA_unmapped_cleaned_F.fq.gz
 #    add2r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_2M/AJ516_2M_RNA_unmapped_cleaned_R.fq.gz
 #    add3f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_3/AJ516_3_RNA_unmapped_cleaned_F.fq.gz
 #    add3r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_3/AJ516_3_RNA_unmapped_cleaned_R.fq.gz
 #    add4f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_3M/AJ516_3M_RNA_unmapped_cleaned_F.fq.gz
 #    add4r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_3M/AJ516_3M_RNA_unmapped_cleaned_R.fq.gz
 #    add5f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_4/AJ516_4_RNA_unmapped_cleaned_F.fq.gz
 #    add5r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_4/AJ516_4_RNA_unmapped_cleaned_R.fq.gz
 #    add6f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_4M/AJ516_4M_RNA_unmapped_cleaned_F.fq.gz
 #    add6r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_4M/AJ516_4M_RNA_unmapped_cleaned_R.fq.gz
 #    add7f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_5/AJ516_5_RNA_unmapped_cleaned_F.fq.gz
 #    add7r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_5/AJ516_5_RNA_unmapped_cleaned_R.fq.gz
 #    add8f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_6/AJ516_6_RNA_unmapped_cleaned_F.fq.gz
 #    add8r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/AJ516_6/AJ516_6_RNA_unmapped_cleaned_R.fq.gz
 #    Strain=$(basename $Assembly .fasta) 
 #    SAindex=11 # Typically between 10 and 15, e.g. for 45Mb genome use 11
 #    OutDir=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/$Strain
 #    mkdir -p $OutDir 
 #    ProgDir=git_repos/niab_repos/fusarium
 #    sbatch $ProgDir/star_fusarium_multipleinput.sh $Assembly $fileF $fileR $add1f $add1r $add2f $add2r $add3f $add3r $add4f $add4r $add5f $add5r $add6f $add6r $add7f $add7r $add8f $add8r $OutDir $SAindex
 # done



#Cufflinks for codingquarry

# for genome in AJ516_2022; do 
#  for Assembly in /home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$genome/AJ516_2022.fasta; do
#     OutDir=/home/jconnell/projects/niab/fusarium/rna_seq_data/re_annotation/$genome  
#     mkdir -p $OutDir
#     AcceptedHits=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/AJ516_2022/*.bam
#     ProgDir=git_repos/niab_repos/fusarium
#     sbatch $ProgDir/cufflinks.sh $AcceptedHits $OutDir
#   done
# done  


#Run Braker

# for file in AJ516_2022; do
#  for Assembly in $(ls projects/niab/fusarium/complete_nanopore_genomes/$file/AJ516_2022.fasta); do
#    Strain=$(echo $Assembly| rev | cut -d '/' -f2 | rev) # Edit to set your ouput directory
#    Organism=$(echo $Assembly | rev | cut -d '/' -f4 | rev) # Edit to set your ouput directory
#    OutDir=/home/jconnell/projects/niab/fusarium/rna_seq_data/re_annotation/braker/$file
#    mkdir -p $OutDir
#    AcceptedHits=niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/AJ516_2022/*.bam
#    GeneModelName="$Organism"_"$Strain"_braker 
#    ProgDir=git_repos/niab_repos/fusarium
#    sbatch $ProgDir/braker_fungi.sh $Assembly $OutDir $AcceptedHits $GeneModelName
#  done
# done 

#Run codingquarry

# for race in AJ516_2022; do
#  for Assembly in /home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$race/AJ516_2022.fasta; do
#     GTF=/home/jconnell/fusarium/rna_seq_data/re_annotation/cufflinks/AJ516_2022/transcripts.gtf
#     OutDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/$race
#     mkdir -p $OutDir
#     ProgDir=/home/jconnell/git_repos/niab_repos/fusarium
#     sbatch $ProgDir/codingquarry.sh $Assembly $GTF $OutDir
#   done
# done  



#Combine annotations 

for strain in AJ516_2022; do
for BrakerGff in $(ls /home/jconnell/fusarium/rna_seq_data/re_annotation/braker/$strain/augustus.hints.gff3); do
Assembly=/home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$strain/AJ516_2022.fasta
importgff=/home/jconnell/fusarium/rna_seq_data/re_annotation/CandidateEffectorGFFs/F._oxysporum_f._sp._lactucae_AJ516_CandidateEffector.gff
CodingQuarryGff=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/AJ516_2022/out/PredictedPass.gff3
PGNGff=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/AJ516_2022/out/PGN_predictedPass.gff3
AddDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/combine_annotations 
FinalDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations
AddGenesList=$AddDir/additional_genes.txt
AddGenesGff=$AddDir/additional_genes.gff
FinalGff=$AddDir/combined_genes.gff
mkdir -p $FinalDir
mkdir -p $AddDir
bedtools intersect -v -a $CodingQuarryGff -b $BrakerGff | grep 'gene'| cut -f2 -d'=' | cut -f1 -d';' > $AddGenesList
bedtools intersect -v -a $PGNGff -b $BrakerGff | grep 'gene'| cut -f2 -d'=' | cut -f1 -d';' >> $AddGenesList
ProgDir=/mnt/shared/scratch/agomez/apps/git_repos/bioinformatics_tools/Gene_prediction
$ProgDir/gene_list_to_gff.pl $AddGenesList $CodingQuarryGff CodingQuarry_v2.0 ID CodingQuary > $AddGenesGff
$ProgDir/gene_list_to_gff.pl $AddGenesList $PGNGff PGNCodingQuarry_v2.0 ID CodingQuary >> $AddGenesGff
$ProgDir/add_CodingQuary_features.pl $AddGenesGff $Assembly > $FinalDir/final_genes_CodingQuary.gff3
$ProgDir/gff2fasta.pl $Assembly $FinalDir/final_genes_CodingQuary.gff3 $FinalDir/final_genes_CodingQuary
cp $BrakerGff $FinalDir/final_genes_Braker.gff3
$ProgDir/gff2fasta.pl $Assembly $FinalDir/final_genes_Braker.gff3 $FinalDir/final_genes_Braker
cat $FinalDir/final_genes_Braker.pep.fasta $FinalDir/final_genes_CodingQuary.pep.fasta | sed -r 's/\*/X/g' > $FinalDir/final_genes_combined.pep.fasta
cat $FinalDir/final_genes_Braker.cdna.fasta $FinalDir/final_genes_CodingQuary.cdna.fasta > $FinalDir/final_genes_combined.cdna.fasta
cat $FinalDir/final_genes_Braker.gene.fasta $FinalDir/final_genes_CodingQuary.gene.fasta > $FinalDir/final_genes_combined.gene.fasta
cat $FinalDir/final_genes_Braker.upstream3000.fasta $FinalDir/final_genes_CodingQuary.upstream3000.fasta > $FinalDir/final_genes_combined.upstream3000.fasta
GffBraker=$FinalDir/final_genes_CodingQuary.gff3
GffQuary=$FinalDir/final_genes_Braker.gff3
GffAppended=$FinalDir/final_genes_appended.gff3
cat $GffBraker $GffQuary > $GffAppended
done
done 


for Strain in AJ516_2022; do
for GffAppended in $(ls /home/jconnell/fusarium/rna_seq_data/re_annotation/AJ516_2022/final_annotations/final_genes_appended.gff3); do
  FinalDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/AJ516_2022/final_annotations/remove_dup_features
  mkdir -p $FinalDir
  # Remove duplicated genes
  GffFiltered=/home/jconnell/fusarium/rna_seq_data/re_annotation/AJ516_2022/final_annotations/remove_dup_features/filtered_duplicates.gff
  ProgDir=/mnt/shared/scratch/agomez/apps/git_repos/bioinformatics_tools/Gene_prediction
  $ProgDir/remove_dup_features.py --inp_gff $GffAppended --out_gff $GffFiltered
  # Rename genes
  GffRenamed=/home/jconnell/fusarium/rna_seq_data/re_annotation/AJ516_2022/final_annotations/remove_dup_features/final_genes_appended_renamed.gff3
  LogFile=/home/jconnell/projects/niab/fusarium/final_predictions/$Strain/final/added_annotations/final_genes_appended_renamed.log
  $ProgDir/gff_rename_genes.py --inp_gff $GffFiltered --conversion_log $LogFile > $GffRenamed
  rm $GffFiltered
  # Create renamed fasta files from each gene feature   
  Assembly=$(ls /home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$Strain/AJ516_2022.fasta)
  $ProgDir/gff2fasta.pl $Assembly $GffRenamed $FinalDir/final_genes_appended_renamed
  # The proteins fasta file contains * instead of Xs for stop codons, these should be changed
  sed -i 's/\*/X/g' $FinalDir/final_genes_appended_renamed.pep.fasta
 done 
done