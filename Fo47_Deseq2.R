#Deseq2 analysis AJ516 count data  

#Set libs

library(DESeq2)
library(tximport)
library(ggplot2)
library(ggrepel)
library(pheatmap)
library(dplyr)
setwd("C:/Users/john.connell/Documents/Bioinformatics_2022/projects/Fusarium_oxysporum/deseq2/Fo47")

#Create tx2gene table 

tx2gene <- read.table("tx2gene.txt")
colnames(tx2gene) <- c("TXNAME", "GENEID")

#Import data

txi.reps <- tximport(paste(list.dirs("./quant_files", full.names=T,recursive=F),"/abundance.tsv",sep=""),type="kallisto",tx2gene=tx2gene,txOut=T)
mysamples <- list.dirs("./quant_files",full.names=F,recursive=F)
txi.genes <- summarizeToGene(txi.reps,tx2gene)
invisible(sapply(seq(1,3), function(i) {colnames(txi.genes[[i]])<<-mysamples}))

#Create experiment design table 

designtable <- mysamples
designtable <- as.data.frame(designtable)
condition <- function(designtable){
  if ((designtable == "Fo47_6M") || (designtable == "Fo47_4M") || (designtable == "Fo47_2M"))
    return ("control")
  else return ("experimental")
}
designtable$condition <- lapply(X = designtable$designtable, FUN = condition)
colnames(designtable) <- c("Sample", "Condition")

#Set up experiment 

colData <- designtable
colData$indrep <- paste0(colData$Condition)

#Define the GLM parameters 

design <- ~ indrep
dds <- DESeqDataSetFromTximport(txi.genes,colData,design)

#Set rowsums threshold 

keep <- rowSums(counts(dds)) >= 50
dds <- dds[keep,]

#Library normalisation

dds <- estimateSizeFactors(dds)

#Run Deseq

dds <- DESeq(dds)
resultsNames(dds)
res <- results(dds)
res
summary(res)
alpha <- 0.05

#Plot differentail expression results 

res= results(dds, alpha=alpha,contrast=c("indrep","experimental","control"))
sig.res <- subset(res,padj<=alpha)
sig.res <- sig.res[order(sig.res$padj),]
sig.res.upregulated <- sig.res[sig.res$log2FoldChange >=1, ]
sig.res.downregulated <- sig.res[sig.res$log2FoldChange <=-1, ]
summary(sig.res)
write.table(sig.res,"Fo47_all_data.txt",sep="\t",na="",quote=F)
#write.table(sig.res.upregulated,"up_data.txt",sep="\t",na="",quote=F)
#write.table(sig.res.downregulated,"down_data.txt",sep="\t",na="",quote=F)

#PCA Plot

vst1<-varianceStabilizingTransformation(dds,blind=TRUE)
data <- plotPCA(vst1, intgroup=c("indrep"), returnData=TRUE)
percentVar <- round(100 * attr(data, "percentVar"))

pca_plot<- ggplot(data, aes(PC1, PC2, color=group)) +
  geom_point(size=2) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + geom_text_repel(aes(label=colnames(vst1))) + theme_light() +
  ggtitle("Fo47 PCA")+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_rect(colour = "black",fill=NA, size=1), 
        axis.title.y = element_text(size = 20),
        axis.title.x = element_text(size = 20),
        plot.title = element_text(size = 30)) +
        scale_color_discrete(breaks=c("experimental", "control"))
coord_fixed()
pca_plot
ggsave("Fo47_PCA_vst_false.jpeg", pca_plot, dpi=300, height=10, width=12)

#Plot heatmap of differential expression 

all_data <- read.table("Fo47_all_data.txt")
subset <- all_data[2]

highlfc <- filter(subset, log2FoldChange >= 10 | log2FoldChange <= -10)
sortedhlfc <- highlfc[order(highlfc$log2FoldChange), , drop = FALSE]
heatmapH <- pheatmap(sortedhlfc, cluster_rows=FALSE, cluster_cols=FALSE, color=colorRampPalette(c("darkblue", "white", "red"))(50), main = "Fo47 l2FC") 
save_pheatmap_pdf <- function(x, filename, width=3, height=25) {
  stopifnot(!missing(x))
  stopifnot(!missing(filename))
  pdf(filename, width=width, height=height)
  grid::grid.newpage()
  grid::grid.draw(x$gtable)
  dev.off()
}
save_pheatmap_pdf(heatmapH, "Fo47_l2FC.pdf")

