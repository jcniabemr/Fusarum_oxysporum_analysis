#!/usr/bin/env python 

#####Script to plot heatmap of effector genes based on L2FC expression tables
####Other fucntions are custom heatmaps based on providing a "," sep list of gene names eg g1,g2,g3

####Example 
# python effector_dict_v2.py \
# -gff final_genes_appended_renamed.gff3 \
# -eff F._oxysporum_f._sp._lactucae_AJ516_CandidateEffector.gff \
# -deg AJ516_l2fc.txt \
# -glist g10200,g3434,g183 \
# -cpn subset1
# -milfc minimum value to filter deg file by
# -mxlfc maximum value to filter deg file by 
# -out output location 

####Required info = 3 
#File1=L2FC table from DESeq2
#File2=Jamies effector gff file  
#File3=gff file of genes

####Import packages 
import argparse 
import seaborn as sns
import pandas as pd 
from tabulate import tabulate
from pylab import savefig
import matplotlib.pyplot as plt
import os.path

####Create lists
gl=[]
mape_gene_list=[]
plot_list=[]
mapeplot=[]
mapleplot=[]
option1=[]
####Create dicts 
all_genes={}
mape_gene={}

####Parse files
ap=argparse.ArgumentParser()
ap.add_argument('-gff',required=True,type=str,help='GFF file of genes')
ap.add_argument('-eff',required=True,type=str,help='Effector gff')
ap.add_argument('-deg',required=True,type=str,help='DEG file from DESeq2')
ap.add_argument('-out',required=True,type=str,help='output file location')
ap.add_argument('-glist',type=str,nargs='+',help='comma seperated list of genes to plot')
ap.add_argument('-cpn',type=str,help='custom heatmap name', default='custom_plot')
ap.add_argument('-milfc',type=int,help='minimum L2FC to plot')
ap.add_argument('-mxlfc',type=int,help='max L2FC to plot')
args=ap.parse_args()

####Open files 
gff=open(args.gff)
ef=open(args.eff)
de=open(args.deg)
gene_list=(args.glist)
custom_plot_name=(args.cpn)
minlfc=(args.milfc)
maxlfc=(args.mxlfc)
outlocation=(args.out)

####Expressed gene list  
for x in de:
    x=x.replace("\n","")
    x=x.split("\t")
    if "baseMean" in x:
        pass
    else:
        gl.append(x[0])
        plot_list.append([x[0], x[2]])

####Create dict of all genes with required info  
for x in gff:
    x=x.replace("\n","")
    x=x.split("\t")
    if x[2] == "gene":
        data=x[8].split(";")[0][3:]
        all_genes[x[0], x[3], x[4]] = data 
        mape_gene[data] = []

####Delete kv where no gene is expressed 
for k,v in list(all_genes.items()):
    if v not in gl:
        del all_genes[k]

####Append effectors to genes 
for x in ef:
    x=x.replace("\n","")
    x=x.split("\t")
    if x[2] == "gene":
        effectcontig = x[0]
        effectstart = x[3]
        effectstop = x[4]
        for j in all_genes:
            if effectcontig == j[0]:
                if effectstart >= j[1]:
                    if effectstop <= j[2]:
                        mape_gene[all_genes[j]].append("mape")
                        
####Delete empty keys in both dicts 
emptymapekeys=[k for k,v in mape_gene.items() if not v]
for k in emptymapekeys:
    del mape_gene[k]

####Create mape and maple gene list  
for k,v in mape_gene.items():
    mape_gene_list.append(k)

####Make heatmap dataframes 
for x in plot_list:
    gene = x[0]
    lfc = x[1]
    for x in mape_gene_list:
        if x == gene:
            mapeplot.append([gene, lfc])

mape_pd = pd.DataFrame(mapeplot, columns=["gene", "l2FC"])
mape_pd = mape_pd.set_index("gene")
mape_pd = mape_pd.astype({'l2FC':'float'})
col_names = ["mape_gene","l2FC"]
savepath = outlocation
filename ='mape_data.txt'
completename = os.path.join(savepath, filename) 
with open(completename, 'w') as file:
    file.write(tabulate(mape_pd, headers=col_names))

####Plot heatmaps 
if not mape_pd.empty:
    mapeheat=sns.clustermap(mape_pd,
        figsize=(10,25),
        cmap='RdBu_r',
        row_cluster=True,
        col_cluster=False,
        center=0)
    plt.suptitle("Mape gene expression", fontsize =25)
    filename = 'mapeheat.png'
    completename = os.path.join(savepath, filename)
    plt.savefig(completename)
else:
    pass

####Custom heatmaps 
####Option 1 custom gene list 
if gene_list:
    for x in gene_list:
        splitgenes=x.split(",")
        for y in splitgenes:
            for x in plot_list:
                if y == x[0]:
                    option1.append(x)
                    cust1 = pd.DataFrame(option1, columns=["gene", "l2FC"])
                    cust1 = cust1.set_index("gene")
                    cust1 = cust1.astype({'l2FC':'float'})
                    plt.figure(figsize=(9,18))
                    customplot1=sns.heatmap(cust1,
                        cmap='RdBu_r',
                        center=0)
                    plt.suptitle("Gene expression", fontsize =25)
                    filename = (custom_plot_name + "_custom_gene_list.png")
                    completename = os.path.join(savepath, filename)
                    plt.savefig(completename)
                else:
                    pass 

####Option 2 custom expresson values 
if minlfc:
    if maxlfc:
        cust2=pd.DataFrame(plot_list, columns=["gene", "l2FC"])
        cust2= cust2.set_index("gene")
        cust2['l2FC']=pd.to_numeric(cust2['l2FC'])
        filtercust2 = cust2[(cust2['l2FC'] >= maxlfc) | (cust2['l2FC'] <= minlfc)]
        col_names=["gene", "l2FC"]
        filename = (custom_plot_name + "_l2fc_expression_data.txt")
        completename = os.path.join(savepath, filename)
        with open (completename, 'w') as file:
            file.write(tabulate(filtercust2, headers=col_names))
        if not filtercust2.empty:
            customplot2=sns.clustermap(filtercust2,
                figsize=(10,25),
                cmap='RdBu_r',
                row_cluster=True,
                col_cluster=False,
                center=0)
            plt.suptitle("Gene expression", fontsize =25)
            filename = (custom_plot_name + "_l2fc_expression_plot.png")
            completename = os.path.join(savepath, filename)
            plt.savefig(completename)
        else:
            pass     