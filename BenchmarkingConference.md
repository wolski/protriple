# Monday, 24 March
### 9:00 – 9:15 Mark Robinson Introduction and Welcome
### 9:15 – 9:45 Keynote Ana Conesa Benchmarking of long-read transcriptomics methods
- Publication: https://www.nature.com/articles/s41592-024-02298-3
- Said that she registered the benchmark about 3 years ago, Process where you review the design, then run the experiment and submit the results. But was like writing the paper twice. Andvantage, if there is a risk of not creating conclusive results, the article will be nevertheless published.
- Communication with the community submitting benchmark results. Once results were obtained, a meeting was organized.
- Community runs the pipeline, but benchmarkers make sure that the results can be replicated. 


### 9:45 – 10:00 Juho Pelto, Benchmarking microbial differential abundance analysis methods by employing only real data
- Microbiome data, compared standard DE methods with microbiome methods and t-test
- Did not had an understanding of the data


### 10:00 – 10:15 Elisabetta Mereu Benchmarking Single-Cell Multiomics Integration to Enhance Cellular and Subpopulation Resolution

### 11:005 – 11:30 Keynote Alice McHardy Critical assessment of metagenome interpretation: community-driven benchmarking challenges for microbiome research
- was not there actually

### 11:30 – 11:45 Sophia Müller-Dott Leveraging Multi-Omics Data for the Evaluation of Kinase Activity Inference and Network Contextualisation
- https://decoupler-py.readthedocs.io/en/latest/ - is actively developed, by  Müller-Dott
- https://github.com/saezlab/decoupler-py - should have the option to analyse lists of phospho sites.
- https://github.com/saezlab/PHONEMeS (this is what seaz likely talked at the HUPO)
- https://github.com/saezlab/corneto

### 11:45 – 12:00 Jiebiao Wang Benchmarking cell segmentation methods for fluorescent images in spatial omics
- compared some AI methods with classical segmentation

### 12:00 – 12:15 Marmar Moussa Benchmarking pretrained language models for modeling antigen-specific TCR-CDR3 regions

### 14:00 – 14:30 Keynote Jessica Jingyi Li Enhancing Reliability and Power in Single-Cell and Spatial Omics Data Analysis with Semi-Synthetic Negative and Positive Control Data
- http://jsb.ucla.edu/about-jingyi-jessica-li
- data simulations frameworks for DNA, RNA and scRNA as well as spatial date, can be used to generate H0 data and then to compute p-values.
- Generalized Additive Models, and generalized mixed effect models (implemented in R.)

### 14:30 – 14:45 Alexander Zelikovsky Benchmarking of software tools for wastewater genomic surveillance
### 14:45 – 15:00 María Morales Martínez BAIHA: Addressing Sex and Gender Bias in AI for Healthcare Applications
- did not understand
### 15:00 – 15:15 Andre Kahles, ETH Zurich, Switzerland Benchmarking Pan-Cancer Analyses using coordinated DNA/RNA Simulations
Again simulation framework for sequencing data, data - privacy.

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
- Joined using ZOOM because of sickness - could not understand much because of her english and zoom.
- Microbiome data
- ZOE.2.0 study is published.


### 11:45 – 12:00 Josep Garnica When there is no ground truth: assessing consistency of transcriptomics-based cell type classifications using internal validation metrics
- Apply methods to Lung Atlas, (Theis Nature Medicine).
- Consistency metrics can detect purely annoted cell types
- Mean consistency score decreases with the number of cell types you are trying to generate

### 12:00 – 12:15 Ines Hellmann, The effect of background noise and its removal on the analysis of single-cell expression data
- Contamination fraction, ambient RNA, SOUPX, 
- DecontX, CellBender
- DecontX best with ambient correction
- Does not impact cell classification or clustering.
- Spillover effect
- DecontX and CellBender - are too conservative


### 14:00 – 14:30 Keynote Malte Lücken - Defining and benchmarking open problems in single-cell analysis via community engagement
- Open Problems
- Decentralized benchmarking exaggerates improvements
- Openproblems.bio - https://openproblems.bio/
- Luecken Nat, Biotech
- Learning meaningful Representations of life Shitov Gloscope best method not cited. Poster 21.
- Benchmark flexibility
- Salas "Optimizing Xenium In Sity data utility" Nature Methods (2025)


### 14:30 – 15:00 Keynote Izaskun Mallona From solo to community benchmarking
- high level
- https://viash.io/
- omnibenchmark is a cli unix feeling,
- Mean to be used by single user?
- omnibenchmark.org

### 15:00 – 15:30 Keynote Salvador Capella-Gutierrez: Scaling up OpenEBench to support community-driven AI model evaluation

https://www.biorxiv.org/content/10.1101/2023.12.19.572303v2.full

# Wednesday

### 9:00 – 9:30 Keynote Gregory Grant: Addressing the Harsh Realities of Omics Benchmarking
- A lot of bitching
- checklist for journals publishing benchmarking, has a paper about checklists for benchmarking https://pubmed.ncbi.nlm.nih.gov/38216661/
- Nature Methods, benchmark section - Three stage process, register benchmark, get approved, then run it, then publish it.

### 9:30 – 9:45 Evgenia Kriventseva: LEMMI platform for continuous benchmarking for metagenomics and amplicon profiling
- Metagenomics, classifiers.
- Reference - Texonomy - Algorithm
- Lemmi https://lemmi.ezlab.org/
- Long and short read data, Alternative Taxonomies, Docker Aptainer, you submit a container, 
- https://www.biorxiv.org/content/10.1101/2025.03.06.641904v1
  
### 9:45 – 10:00 Cas Wognum: Polaris - An industry-led initiative to critically assess machine learning in drug discovery
- Polaris hub on github
- Trageting machine learning first
- The benchmarking platform https://github.com/polaris-hub/polaris
- https://polarishub.io/ - see code snippets on website
- community initiatives
- how to visualize results

Audience question: Why not Kaggle?
Audience question: Why you and not : Open Problems, Kaggle
- focus: machine learning, drug discovery, industry

### 10:00 – 10:15  Bäuerle: Using a continuous benchmarking platform to compare different variant calling pipelines across Germany
- Published : https://f1000research.com/articles/12-1125
- Personalized medicine for oncology
- Ilumina dragon,
- provide reference pipeline doing variance calling
- datavzrd snakemake, zenodo, github pages, github actions, and snakemake
- NCBench results 
- OSF Project - Zenodo / Google drive
- Johannes Koester - snakemake developer
### 10:00 – 10:15 Thaleia Ntiniakou: Community benchmark of centre-based multiscale modelling tools


# On reflection
## discuss with Proteobench on differential expression analysis software
- download, run, write parameter file. Would require that you can rerun the benchmark using the parameters
- Create a set of DE results which can be replicated (e.g. use prolfquabenchmark).
- Allow upload of DE results and plot it.

Robrecht Cannoodt - developer of viash "Open Problems for Single Cell Analysis, Open Pipelines, and the processing of Tabula Sapiens v2."


There were 3 people from Robert Ivaneks group: Cervenka, Burri, Roux

Igor Cervenka - bio Imaging Mass cytometry data https://biomedizin.unibas.ch/en/persons/ewelina-bartoszek/
[Hypirion](https://www.standardbio.com/hyperion-plus) -  is the evolution of flow cytometry, core or microscopy

Centralized, Semicentralized, Local Benchmarks?

Erik van Nijmwegen - lineage tracing methods, Molecule labelling methods
- Special interest group in multiple societies


