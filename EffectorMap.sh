#!/usr/bin/env bash 
#SBATCH -J effectormap
#SBATCH -p short 
#SBATCH --mem=4G
#SBATCH --cpus-per-task=1

####Script to run effector_map.py 
#Effectormap.py has multiple options. 
####README####

#####The required options are:####
#The gff gene file passed using flag <-gff> 
#The effector file passed using flag <-eff>
#The differentially expressed gene <-dge>

####The optional options are:####
###To make a custom heatmap filtered by L2FC (DEGfile) use
#The min L2FC to filter by flag <-milfc>
#The max L2FC to filter by flag <-mxlfc>
#The name of the plot flag <-cpn>

####To make a custom heatmap with gene list 
#The comma sepperated list of genes given to <-glist>
#The custom plot name <-cpn>

##############################Exaple of runnig with minimum options############################################ 
gff_file=/home/jconnell/fusarium/gene_effector_interaction/AJ516/final_genes_appended_renamed.gff3
deg=/home/jconnell/fusarium/gene_effector_interaction/AJ516/AJ516_l2fc.txt
eff=/home/jconnell/fusarium/gene_effector_interaction/AJ516/F._oxysporum_f._sp._lactucae_AJ516.fna_CandidateEffector.gff
output_location=/home/jconnell/fusarium/gene_effector_interaction/AJ516 
effectormap=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum/effector_map_V2.py
python $effectormap -gff $gff_file -deg $deg -eff $eff -out $output_location

#############################Example of running with all options################################################# 
# gff_file=/home/jconnell/fusarium/gene_effector_interaction/final_genes_appended_renamed.gff3
# deg=/home/jconnell/fusarium/gene_effector_interaction/AJ516_l2fc.txt
# eff=/home/jconnell/fusarium/gene_effector_interaction/F._oxysporum_f._sp._lactucae_AJ516_CandidateEffector.gff
# strain=AJ516
# plot_name=custom_plot
# gene_list=g23494,g12707,g6357,g14775,g157
# min_lfc=-10
# maxlfc=10
# output_location=/home/jconnell/fusarium/gene_effector_interaction 
# effectormap=/home/jconnell/git_repos/niab_repos/fusarium_oxysporum/effector_map.py
# python $effectormap -gff $gff_file -deg $deg -eff $eff -str $strain -cpn $plot_name	-glist $gene_list -milfc $min_lfc -mxlfc $maxlfc -out $output_location

