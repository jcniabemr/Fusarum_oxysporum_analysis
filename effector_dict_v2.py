#!/usr/bin/env python 

#####Script to plot heatmap of effector genes based on L2FC expression tables

####Import packages 
import argparse 
import re
import seaborn as sns
import pandas as pd 
from tabulate import tabulate
from pylab import savefig
import matplotlib.pyplot as plt

####Required files = 3 
#File1=L2FC table from DESeq2
#File2=Jamies effector gff file  
#File3=gff file of genes 

####Create list/dicts
gl=[]
all_genes={}
mape_gene={}
maple_gene={}
mape_gene_list=[]
maple_gene_list=[]
plot_list=[]
mapeplot=[]
mapleplot=[]

####Parse files
ap=argparse.ArgumentParser()
ap.add_argument('-gff',required=True,type=str,help='GFF file of genes')
ap.add_argument('-ef',required=True,type=str,help='Effector gff')
ap.add_argument('-de',required=True,type=str,help='DEG file from DESeq2')
ap.add_argument('-st',required=True,type=str,help='Strain of Fo eg AJ516')
args=ap.parse_args()

####Open files 
gff=open(args.gff)
ef=open(args.ef)
de=open(args.de)
st=(args.st)

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
        maple_gene[data] = []

####Delete kv where no gene is expressed 
for k,v in list(all_genes.items()):
    if v not in gl:
        del all_genes[k]

####Append effectors to genes 
for x in ef:
    x=x.replace("\n","")
    x=x.split("\t")
    effectcontig = x[0]
    effectstart = x[3]
    effectstop = x[4]
    m=re.findall(st, x[8])
    for j in all_genes:
        if effectcontig == j[0]:
              if effectstart >= j[1]:
                  if effectstop <= j[2]:
                    if m:
                        mape_gene[all_genes[j]].append("mape")
                    if not m:
                        maple_gene[all_genes[j]].append("mapele")

####Delete empty keys in both dicts 
emptymapekeys=[k for k,v in mape_gene.items() if not v]
for k in emptymapekeys:
    del mape_gene[k]

emptymaplekeys=[k for k,v in maple_gene.items() if not v]
for k in emptymaplekeys:
    del maple_gene[k]

####Create mape and maple gene list  
for k,v in mape_gene.items():
    mape_gene_list.append(k)

for k,v in maple_gene.items():
    maple_gene_list.append(k)

####Make heatmap dataframes 
for x in plot_list:
    gene = x[0]
    lfc = x[1]
    for x in mape_gene_list:
        if x == gene:
            mapeplot.append([gene, lfc])
    for x in maple_gene_list:
        if x == gene:
            mapleplot.append([gene, lfc])

mape_pd = pd.DataFrame(mapeplot, columns=["gene", "l2FC"])
mape_pd = mape_pd.set_index("gene")
mape_pd = mape_pd.astype({'l2FC':'float'})
col_names=["mape_gene","l2FC"]
with open("mape_data" + '.txt', 'w') as file:
    file.write(tabulate(mape_pd, headers=col_names))

maple_pd = pd.DataFrame(mapleplot, columns=["gene", "l2FC"])
maple_pd = maple_pd.set_index("gene")
maple_pd = maple_pd.astype({'l2FC':'float'})
col_names=["maple_gene","l2FC"]
with open("maple_data" + '.txt', 'w') as file:
    file.write(tabulate(maple_pd, headers=col_names))

####Plot heatmaps 
plt.figure(figsize=(9,18))
mapeheat=sns.heatmap(mape_pd,cmap='RdBu')
plt.savefig('mapeheat.png')
mapleheat=sns.heatmap(maple_pd,cmap='RdBu')
plt.savefig('mapleheat.png')



def function_make_plot (filename):
    plt.figure(figsize=(9,18))
    dd=sns.heatmap(filename,cmap='RdBu')
    plt.savefig(filename + ".png")

for x in [mape_pd, maple_pd]:
    function_make_plot(x)
