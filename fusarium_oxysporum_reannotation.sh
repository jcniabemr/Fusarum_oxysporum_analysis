#!/usr/bin/env bash 
#SBATCH -p long 
#SBATCH -J Fusarium_annotation
#SBATCH --mem=50G
#SBATCH --cpus-per-task=4

##### Scripts documenting the reannotate fusarium genomes assemblys with latest and additonal RNA seq data
####Genomed to be anntated 
#### Race_1  
#         PF1_2022
#         PF2_2022    
#         FYTO7211_2011
#		      AJ520_2022
#### Race_4  
#         AJ516_2022
#         AJ592_2022
#         AJ705_2022

####Copy and rename decontamimated read files. 
# for x in $(ls /home/jconnell/niab/fusarium/rna_seq_data/decontaminated); do
#   for y in $(ls /home/jconnell/niab/fusarium/rna_seq_data/decontaminated/${x}); do 
# 	 mkdir -p /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${x}/${y}
# 	 cp /home/jconnell/niab/fusarium/rna_seq_data/decontaminated/${x}/${y}/F/star_aligmentUnmapped.out.mate1cleaned.fq.gz\
#      /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${x}/${y}/"$y"_RNA_unmapped_cleaned_F.fq.gz
#    cp /home/jconnell/niab/fusarium/rna_seq_data/decontaminated/${x}/${y}/R/star_aligmentUnmapped.out.mate2cleaned.fq.gz\
#      /home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${x}/${y}/"$y"_RNA_unmapped_cleaned_R.fq.gz
#   done
# done  

####Alignment of R4 and AJ516 Race 4 RNA-Seq data with genome using STAR gapped aligner 
# for x in AJ516_2022; do 
#   strain=$(basename ${x} _2022)
#     Assembly=/home/jconnell/niab/fusarium/complete_nanopore_genomes/${x}/"$strain"_2022.fasta; do
#     fileF=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/F/Folac_R4_1_trim.fq.gz    
#     fileR=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/R/Folac_R4_2_trim.fq.gz
#     add1f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_F.fq.gz
#     add1r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_R.fq.gz
#     add2f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_F.fq.gz
#     add2r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_R.fq.gz
#     add3f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_F.fq.gz
#     add3r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_R.fq.gz
#     add4f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_F.fq.gz
#     add4r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_R.fq.gz
#     add5f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_F.fq.gz
#     add5r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_R.fq.gz
#     add6f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_F.fq.gz
#     add6r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_R.fq.gz
#     add7f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_F.fq.gz
#     add7r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_R.fq.gz
#     add8f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_6/"$strain"_6_RNA_unmapped_cleaned_F.fq.gz
#     add8r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/"$strain"_6/"$strain"_6_RNA_unmapped_cleaned_R.fq.gz
#     genome=$(basename $Assembly .fasta) 
#     SAindex=11 # Typically between 10 and 15, e.g. for 45Mb genome use 11
#     OutDir=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/$Strain
#     mkdir -p $OutDir 
#     ProgDir=git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/star_fusarium_multipleinput.sh $Assembly $fileF $fileR $add1f $add1r $add2f $add2r $add3f $add3r $add4f $add4r $add5f \
#      $add5r $add6f $add6r $add7f $add7r $add8f $add8r $OutDir $SAindex $strain
#  done

# ####AJ705 Race4
#  for x in AJ705_2022; do 
#     strain=$(basename ${x} _2022)
#     Assembly=/home/jconnell/niab/fusarium/complete_nanopore_genomes/${x}/"$strain"_2022.fasta
#     fileF=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/F/Folac_R4_1_trim.fq.gz    
#     fileR=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R4/R/Folac_R4_2_trim.fq.gz
#     add1f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_F.fq.gz
#     add1r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_R.fq.gz
#     add2f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_F.fq.gz
#     add2r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_R.fq.gz
#     add3f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_F.fq.gz
#     add3r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_R.fq.gz
#     add4f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_F.fq.gz
#     add4r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_R.fq.gz
#     add5f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_F.fq.gz
#     add5r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_R.fq.gz
#     add6f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5M/"$strain"_5M_RNA_unmapped_cleaned_F.fq.gz
#     add6r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5M/"$strain"_5M_RNA_unmapped_cleaned_R.fq.gz
#     add7f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_F.fq.gz
#     add7r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_R.fq.gz
#     add8f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_6M/"$strain"_6M_RNA_unmapped_cleaned_F.fq.gz
#     add8r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_6M/"$strain"_6M_RNA_unmapped_cleaned_R.fq.gz
#     genome=$(basename $Assembly .fasta) 
#     SAindex=11 # Typically between 10 and 15, e.g. for 45Mb genome use 11
#     OutDir=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/$genome
#     mkdir -p $OutDir 
#     ProgDir=git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/star_fusarium_multipleinput.sh $Assembly $fileF $fileR $add1f $add1r $add2f $add2r $add3f $add3r $add4f $add4r $add5f\
#     $add5r $add6f $add6r $add7f $add7r $add8f $add8r $OutDir $SAindex $strain
# done

###AJ520 Race1
# for x in AJ520_2022; do 
#     strain=$(basename ${x} _2022)
#     Assembly=/home/jconnell/niab/fusarium/complete_nanopore_genomes/${x}/"$strain"_2022.fasta
#     fileF=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R1/F/Folac_R1_1_trim.fq.gz    
#     fileR=/home/jconnell/projects/niab/fusarium/RNA_Seq_data/trimmed/Folac_R1/R/Folac_R1_2_trim.fq.gz
#     add1f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_F.fq.gz
#     add1r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_R.fq.gz
#     add2f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_F.fq.gz
#     add2r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_R.fq.gz
#     add3f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_F.fq.gz
#     add3r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_R.fq.gz
#     add4f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_F.fq.gz
#     add4r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_R.fq.gz
#     add5f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_F.fq.gz
#     add5r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_R.fq.gz
#     add6f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_F.fq.gz
#     add6r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_R.fq.gz
#     add7f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_R1M/"$strain"_R1M_RNA_unmapped_cleaned_F.fq.gz
#     add7r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_R1M/"$strain"_R1M_RNA_unmapped_cleaned_R.fq.gz
#     add8f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_R4M/"$strain"_R4M_RNA_unmapped_cleaned_F.fq.gz
#     add8r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_R4M/"$strain"_R4M_RNA_unmapped_cleaned_R.fq.gz
#     genome=$(basename $Assembly .fasta) 
#     SAindex=11 # Typically between 10 and 15, e.g. for 45Mb genome use 11
#     OutDir=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/$genome
#     mkdir -p $OutDir 
#     ProgDir=git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/star_fusarium_multipleinput.sh $Assembly $fileF $fileR $add1f $add1r $add2f $add2r $add3f $add3r $add4f $add4r $add5f\
#     $add5r $add6f $add6r $add7f $add7r $add8f $add8r $OutDir $SAindex $strain
#  done

# ####AJ260 - stocks 4 - annotated only from experimental RNA - Seq data 
# for x in AJ260_2022; do 
#     strain=$(basename ${x} _2022)
#     Assembly=/home/jconnell/niab/fusarium/complete_nanopore_genomes/${x}/*.fasta
#     add1f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_F.fq.gz
#     add1r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_1M/"$strain"_1M_RNA_unmapped_cleaned_R.fq.gz
#     add2f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_F.fq.gz
#     add2r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2/"$strain"_2_RNA_unmapped_cleaned_R.fq.gz
#     add3f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_F.fq.gz
#     add3r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_2M/"$strain"_2M_RNA_unmapped_cleaned_R.fq.gz
#     add4f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_F.fq.gz
#     add4r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3/"$strain"_3_RNA_unmapped_cleaned_R.fq.gz
#     add5f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_F.fq.gz
#     add5r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_3M/"$strain"_3M_RNA_unmapped_cleaned_R.fq.gz
#     add6f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_F.fq.gz
#     add6r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4/"$strain"_4_RNA_unmapped_cleaned_R.fq.gz
#     add7f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_F.fq.gz
#     add7r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_4M/"$strain"_4M_RNA_unmapped_cleaned_R.fq.gz
#     add8f=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_F.fq.gz
#     add8r=/home/jconnell/niab/fusarium/rna_seq_data/RNA_for_annotation/${strain}/"$strain"_5/"$strain"_5_RNA_unmapped_cleaned_R.fq.gz
#     SAindex=11 # Typically between 10 and 15, e.g. for 45Mb genome use 11
#     OutDir=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/$x
#     mkdir -p $OutDir 
#     ProgDir=git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/star_fusarium_AJ260.sh $Assembly $add1f $add1r $add2f $add2r $add3f $add3r $add4f $add4r $add5f\
#     $add5r $add6f $add6r $add7f $add7r $add8f $add8r $OutDir $SAindex $strain
#  done

####Cufflinks for codingquarry
# for genome in AJ705_2022 AJ260_2022 AJ520_2022; do 
#     OutDir=/home/jconnell/projects/niab/fusarium/rna_seq_data/re_annotation/$genome  
#     mkdir -p $OutDir
#     AcceptedHits=/home/jconnell/niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/${genome}/*.bam
#     ProgDir=git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/cufflinks.sh $AcceptedHits $OutDir
# done  

# ####Run Braker
# for file in AJ260_2022; do
#    Assembly=projects/niab/fusarium/complete_nanopore_genomes/$file/"$file".fasta
#    Strain=$(echo $Assembly| rev | cut -d '/' -f2 | rev) 
#    Organism=$(echo $Assembly | rev | cut -d '/' -f4 | rev) 
#    OutDir=/home/jconnell/projects/niab/fusarium/rna_seq_data/re_annotation/braker/$file
#    mkdir -p $OutDir
#    AcceptedHits=niab/fusarium/rna_seq_data/STAR_pathogen_annotation_alignment/${file}/*.bam
#    GeneModelName="$Organism"_"$Strain"_braker2
#    ProgDir=git_repos/niab_repos/fusarium_oxysporum
#    sbatch $ProgDir/braker.sh $Assembly $OutDir $AcceptedHits $GeneModelName
# done 
####http://topaz.gatech.edu/genemark/license_download.cgi #genemark install 


###Run codingquarry
# for race in AJ705_2022 AJ520_2022; do
#  for Assembly in /home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$race/"$race".fasta; do
#     GTF=/home/jconnell/fusarium/rna_seq_data/re_annotation/cufflinks/$race/transcripts.gtf
#     OutDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/$race
#     mkdir -p $OutDir
#     ProgDir=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum
#     sbatch $ProgDir/codingquarry.sh $Assembly $GTF $OutDir
#   done
# done  

####Combine annotations 
source activate bedtools

for strain in AJ520_2022; do
for BrakerGff in $(ls /home/jconnell/fusarium/rna_seq_data/re_annotation/braker/$strain/augustus.hints.gff3); do
Assembly=/home/jconnell/fusarium/complete_nanopore_genomes/$strain/$strain.fasta
CodingQuarryGff=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/$strain/out/PredictedPass.gff3
PGNGff=/home/jconnell/fusarium/rna_seq_data/re_annotation/codingquarry/$strain/out/PGN_predictedPass.gff3
AddDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/combine_annotations 
FinalDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations/
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


for strain in AJ520_2022; do
for GffAppended in $(ls /home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations/final_genes_appended.gff3); do
  FinalDir=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations/remove_dup_features
  mkdir -p $FinalDir
  # Remove duplicated genes
  GffFiltered=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations/remove_dup_features/filtered_duplicates.gff
  ProgDir=/mnt/shared/scratch/agomez/apps/git_repos/bioinformatics_tools/Gene_prediction
  $ProgDir/remove_dup_features.py --inp_gff $GffAppended --out_gff $GffFiltered
  # Rename genes
  GffRenamed=/home/jconnell/fusarium/rna_seq_data/re_annotation/$strain/final_annotations/remove_dup_features/final_genes_appended_renamed.gff3
  $ProgDir/gff_rename_genes.py --inp_gff $GffFiltered --conversion_log final_genes_appended_renamed.log > $GffRenamed
  rm $GffFiltered
  # Create renamed fasta files from each gene feature   
  Assembly=$(ls /home/jconnell/projects/niab/fusarium/complete_nanopore_genomes/$strain/"$strain".fasta)
  $ProgDir/gff2fasta.pl $Assembly $GffRenamed $FinalDir/final_genes_appended_renamed
  # The proteins fasta file contains * instead of Xs for stop codons, these should be changed
  sed -i 's/\*/X/g' $FinalDir/final_genes_appended_renamed.pep.fasta
 done 
done

# ####Create gene effector dict

# for x in $(cat AJ516_all_data.txt | cut -f1); do
#     cat AJ516_genes | grep -w $x >> expressed_gene_db
# done  

# ####Crete effector gene dict 
# python /home/jconnell/git_repos/niab_repos/fusarium_oxysporum/effector_dict.py \
#     -g expressed_gene_db \
#     -c F._oxysporum_f._sp._lactucae_AJ516_CandidateEffector.gff \
#     > effectors_in_expressed_gene.txt