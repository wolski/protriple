# Tuesday

### 9:00 – 9:30 Keynote Yue Cao BenchHub – an R ecosystem for living benchmark
- R6 classes submitted to Bioconductor -> will it be accepted

### 9:30 – 9:450 Justine Leclerc, RAI Platform—Reliable AI for Biomedicine
- Conformal prediction - Conformal prediction is a statistical framework that provides valid measures of uncertainty for predictions made by machine learning models.

### 9:45 – 10:00 Ahmed Mahfouz Rethinking Splicing Model Performance: From Computational Success to Clinical Reality
- Splice perdiction methods evalutated on small but real clinical dataset.
- Shows that if you use this dataset then the splice site prediction software apears much worse, then previously reported.
Can provide contact Marlen Lauffer (DCRT/LUMC), Looked into rare diseases.


### 10:00 – 10:15 Erik van Nimwegen Why is it so hard to analyze single-cell RNA-seq data?
- Normalization of scRNA data.
- Open critique of Ahlman-Etze and Huber publication which benchmarked normalization methods and recommends log(p+1)
- He shows that his method is better.

###  11:00 – 11:30 Keynote, Hongkai Ji, A systematic evaluation of highly variable gene selection methods for single-cell RNA-seq and beyond
- Benchmarking of HVG -> a lot of datasets.
- Have a package with ensemble method, which can be easily integrated into Seurat.
- Q. Do they published the list of the HV genes and why not use it as standard?


### 11:30 – 11:45 Di Wu, Evaluation of differential expression analysis methods for metatranscriptomics data

### 11:45 – 12:00 Josep Garnica When there is no ground truth: assessing consistency of transcriptomics-based cell type classifications using internal validation metrics
- Apply methods to Lung Atlas, (Theis Nature Medicine).
- Consistency metrics can detect purely annoted cell types
- Mean consistency score decreases with the number of cell types you are trying to generate

### 12:00 – 12:15 Ines Hellmann, The effect of background noise and its removal on the analysis of single-cell expression data
Contamination fraction, ambient RNA, SOUPX, 
DecontX, CellBender
DecontX best with ambient correction
Does not impact cell classification or clustering.
Spillover effect
DecontX and CellBender - are too conservative
