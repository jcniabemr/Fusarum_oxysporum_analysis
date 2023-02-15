#!/usr/bin/env python 

#create gene - effector db for expressed AJ516 genes  

#Import package
import argparse
from collections import defaultdict 

#Parse files
ap = argparse.ArgumentParser()
ap.add_argument('-g',required=True,type=str,help='Expressed genes file')
ap.add_argument('-c',required=True,type=str,help='Candidate effectors')
args = ap.parse_args()

#Open files
infile1 = open(args.g)
infile2 = open(args.c)

expressed_dict = {}
gene_dict = {}

for x in infile1:
    x = x.replace("\n", "")
    x = x.split("\t")
    gene = x[1]
    expressed_dict[x[0], x[2], x[3]] = gene
    gene_dict[gene] = []

for y in infile2:
    y = y.replace("\n","")
    y = y.split("\t")
    effectcontig = y[0]
    effectstart = y[3]
    effectstop = y[4]
    for j in expressed_dict:
    	if effectcontig == j[0]:
    		if effectstart >= j[1]:
    			if effectstop <= j[2]:
    				gene_dict[expressed_dict[j]].append("effector")

empty_keys = [k for k,v in gene_dict.items() if not v]
for k in empty_keys:
    del gene_dict[k]

for x in gene_dict:
    print (x, ":", gene_dict[x])

