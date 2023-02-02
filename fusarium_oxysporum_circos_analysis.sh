#!/usr/bin/env bash 
#SBATCH -J circos
#SBATCH -p short
#SBATCH --mem=5G
#SBATCH --cpus-per-task=4


####Script for the consruciton of circos plots for Fusarium oxysporum genomes of different races 
####Circos plots constructed:
####FOLaR1 (AJ520) v FOLy (4287) 
####FOLaR4 (AJ516)  v FOLy 
####FOLaR1 (AJ520) v FOLaR4 (AJ516) 
####AJ516 v AJ705 (LS regions)
####AJ705 vs Fol

####516 vs 705
# a=$(ls /home/jconnell/niab/fusarium/complete_nanopore_genomes | grep -v "fasta\|gff\|PF20\|PF1\|fyto\|592")
# for x in $(echo ${a}); do 
# 	for strain in /home/jconnell/niab/fusarium/complete_nanopore_genomes/${x}; do
# 		Genome1=${strain}/*renamed.fasta
# 		OutDir=/home/jconnell/niab/fusarium/circos/${x}
# 		mkdir -p $OutDir
# 		ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# 		$ProgDir/python_create_circos_file.py --genome $Genome1 --contig_prefix ${x} > $OutDir/${x}_Illumina_genome.txt
# 	done 
# done 

####Create synteny links for 516 vs 705 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ516_2022/AJ516_2022_renamed.fasta
# Genome2=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ705_2022/AJ705_2022_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/circos/705_vs_516
# mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 

####Run circos
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/705vs516runcircos.sh
# OutDir=/home/jconnell
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir

####AJ520 vs AJ516
####Create synteny links for 520 vs 516 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ516_2022/AJ516_2022_renamed.fasta
# Genome2=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ520_2022/AJ520_2022_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/circos/520_vs_516
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 

####Run circos
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/520vs516runcircos.sh
# OutDir=/home/jconnell/
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir

####4287 vs 520 
#Rename contigs 
# for Assembly in /home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta; do
#  touch tmp.csv
#  OutDir=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/renamed_contigs
#  mkdir -p $OutDir
#  name=$(basename $Assembly)
#  ProgDir=git_repos/niab_repos/pipeline_canker_cherry/cherry_canker_pipeline
#  $ProgDir/remove_contaminants.py --inp $Assembly --out $OutDir/"$name" --coord_file tmp.csv
#  rm tmp.csv
# done

####Create synteny links for 4287 vs 520 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta
# Genome2=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ520_2022/AJ520_2022_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/circos/4287_vs_520
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 
 
####Run circos
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/520vs4218runcircos.sh
# OutDir=/home/jconnell
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir
 
####4287 vs fus2 
####Rename contigs 
# for Assembly in /home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta; do
#  touch tmp.csv
#  OutDir=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/renamed_contigs
#  mkdir -p $OutDir
#  name=$(basename $Assembly)
#  ProgDir=git_repos/niab_repos/pipeline_canker_cherry/cherry_canker_pipeline
#  $ProgDir/remove_contaminants.py --inp $Assembly --out $OutDir/"$name" --coord_file tmp.csv
#  rm tmp.csv
# done

####Create synteny links for 4287 vs fus2 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta
# Genome2=/home/jconnell/niab/fusarium/complete_nanopore_genomes/Fus2/Fus2_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/complete_nanopore_genomes/fus2_vs_4287
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 

####Run circos
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/fus2vs4218runcircos.sh
# OutDir=/home/jconnell/
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir

####4287 vs 516
####Create synteny links for 4287 vs 516 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta
# Genome2=/home/jconnell/niab/fusarium/complete_nanopore_genomes/AJ516_2022/AJ516_2022_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/circos/4287_vs_516
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 

####Run circos
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/516vs4218runcircos.sh
# OutDir=/home/jconnell
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir

####4287 vs 705
####Create synteny links for 4287 vs 705 ideogram file 
# Genome1=/home/jconnell/niab/fusarium/complete_nanopore_genomes/4287/4287_renamed.fasta
# Genome2=/home/jconnell/fusarium/complete_nanopore_genomes/AJ705_2022/AJ705_2022_renamed.fasta
# OutDir=/home/jconnell/niab/fusarium/circos/4287_vs_705
# mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/satsuma_synteny.sh $Genome1 $Genome2 $OutDir 

####Run circos 
# Conf=/home/jconnell/git_repos/niab_repos/fusarium/705vs4218runcircos.sh
# OutDir=/home/jconnell
# #mkdir -p $OutDir
# ProgDir=/home/jconnell/git_repos/emr_repos/Fv_C-variants/Circos
# sbatch $ProgDir/circos.sh $Conf $OutDir
