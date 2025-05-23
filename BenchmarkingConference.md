Modern benchmarking: advancing computational methods in molecular biology

https://sites.google.com/view/ascona2025

# Monday, 24 March
### 9:00 – 9:15 Mark Robinson Introduction and Welcome
### 9:15 – 9:45 Keynote Ana Conesa Benchmarking of long-read transcriptomics methods
- Publication: https://www.nature.com/articles/s41592-024-02298-3
- Publication process with Nature where you review the design, then run the experiment and submit the results. Said that she registered the benchmark about 3 years ago. Andvantage, if there is a risk of not creating conclusive results, the article will be nevertheless published, which is not relevant for Benchmarking. It was like writing the paper twice. 
- Communication with the community submitting benchmark results. Once results were obtained, a meeting was organized.
- Community (tool developers) run the pipeline, but benchmark team make sure that the results can be replicated.


### 9:45 – 10:00 Juho Pelto, Benchmarking microbial differential abundance analysis methods by employing only real data
- Microbiome data, compared standard DE methods with microbiome methods and t-test
- Did not had an understanding of the data

### 10:00 – 10:15 Elisabetta Mereu: Benchmarking Single-Cell Multiomics Integration to Enhance Cellular and Subpopulation Resolution
- https://www.nature.com/articles/s41587-020-0469-4
- See Figure 1 for visual summary.

### 11:00 – 11:30 Matt Ritchie: Benchmarking long-read RNA-sequencing technologies with LongBench 
- https://www.nature.com/articles/s41592-023-02026-3
- https://github.com/XueyiDong/LongReadBenchmark
- https://github.com/XueyiDong/LongReadBenchmark/blob/master/ExpeDesign.png

### 11:30 – 11:45 Sophia Müller-Dott Leveraging Multi-Omics Data for the Evaluation of Kinase Activity Inference and Network Contextualisation
- https://decoupler-py.readthedocs.io/en/latest/ - is actively developed, by  Müller-Dott
- https://github.com/saezlab/decoupler-py - should have the option to analyse lists of phospho sites.
- https://github.com/saezlab/PHONEMeS (this is what seaz likely talked at the HUPO)
- https://github.com/saezlab/corneto

### 11:45 – 12:00 Jiebiao Wang Benchmarking cell segmentation methods for fluorescent images in spatial omics
- compared some AI methods with classical segmentation
- AI methods better then base benchmark

### 12:00 – 12:15 Marmar Moussa Benchmarking pretrained language models for modeling antigen-specific TCR-CDR3 regions
- https://www.ou.edu/coe/cs/people/faculty/marmar-moussa

### 14:00 – 14:30 Keynote Jessica Jingyi Li Enhancing Reliability and Power in Single-Cell and Spatial Omics Data Analysis with Semi-Synthetic Negative and Positive Control Data
- http://jsb.ucla.edu/about-jingyi-jessica-li
- data simulations frameworks for DNA, RNA and scRNA as well as spatial date, can be used to generate `H_0` data and then to compute p-values.
- Generalized Additive Models, and generalized mixed effect models, therefore implementation in R

### 14:30 – 14:45 Alexander Zelikovsky Benchmarking of software tools for wastewater genomic surveillance

### 14:45 – 15:00 María Morales Martínez BAIHA: Addressing Sex and Gender Bias in AI for Healthcare Applications
- Barcelona center of supercomputing

### 15:00 – 15:15 Andre Kahles, ETH Zurich, Switzerland Benchmarking Pan-Cancer Analyses using coordinated DNA/RNA Simulations
- simulation framework for sequencing data, data - privacy
- site project

  
# Tuesday

### 9:00 – 9:30 Keynote Yue Cao BenchHub – an R ecosystem for living benchmark
- R6 classes submitted to Bioconductor -> will it be accepted?

### 9:30 – 9:450 Justine Leclerc, RAI Platform—Reliable AI for Biomedicine
- Conformal prediction - Conformal prediction is a statistical framework that provides valid measures of uncertainty for predictions made by machine learning models.
- Developed by USZ dermatology - Christoph Seiler https://www.usz.ch/team/christof-seiler/

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


# Thursday 

Keynote
### 9:00 Alice McHardy: Critical assessment of metagenome interpretation: community-driven benchmarking challenges for microbiome research
- Computational Metagenomics Genome and Taxonomic 'binning' -> represent higher lever grouping e.g. E.Coli. Then a bin is called a genome. 
- Profiling -> gives taxa and relative abundances.
State of benchmarking
- no agreement of reviewers on datasets and metrics
- CAMI -> datasets, evaluation measures, non public datasets, reproducibility
- Multi sample with long and short reads
- env.specific Marine Plant associated
- [data.cami-challenge.org](https://cami-challenge.org/)
- Substantial improvements between CAMI1 and CAMI2.
- CAMI III human microbiome related challenges
- camisim - simulating benchmarking data
- isac newton - cambridge, in person meetings, about metric development, workshop about results. blinding of results. ISMB - session biome track.
- funding source - no funding - infastructure proposal

### 9:45 – 10:00 Xiaoqi Liang: Multi-task benchmarking of spatially resolved gene expression simulation models
- benchmarkInsights, benchHub SRTSim, scDesign
- sydneybiox.github
- publication in GenomeBiology

Q. Methods for quantifiying dataset similarity, Marieke Stolte, Andrea Bommert, Kappenberg.

### 10:00 – 10:15 Michaela Mueller: A toolbox for iterative construction and quality evaluation of large-scale single cell reference atlases

- Publication Nature Methods, Malte Luecken, Fabian Theis https://www.nature.com/articles/s41592-025-02624-3
- scAtlasTb - a toolbox for single cell atlas building. solo benchmarking 
- Expression based Morans I metric - spatial autocorrelation
- Altas level - Batch effect very strong compared to biology -> therfore integration is needed -> danger of overintegrating.

### 11:00 – 11:30 Keynote Moritz Herrmann : On Machine Learning as an Empirical Science: Benchmarking and Beyond
- Moritz Hardt
- imagenet, glue, superglue, coco, pascal voc - example benchmark datasets
- anne laure Boulesteix, Manuel Eugster Neutral Comparison Studies
- A replication crisis in ML Matthew Hutson, other important Paper - Jessica Hullman, Kapoor, Gelman Andrew, Narayana
- Moritz Hermann, Boulesteix benchmark survival pred. methods. Briefing in Bioinformatics (2021)
- cox proportional hazard model very competitive, no clear winner.
- Niessl, Hermann, Boulesteix, Over-optimism in benchmark studies.
- Carolin Strobel, Friedrich Leisch (2022). Performance = Method x Dataset (x Metrics)
- Hermann, Position Why we must rethink 2024 / Benchmark results are conditional on the benchmark design
- Instead of comparing tools, compare to baseline

  
### 11:30 – 11:45 Joshua W.K. Ho : Incorporating metamorphic testing in bioinformatics software benchmarking (University of Hong-Kong)
- test case selection problem - boundary cases finding is challenging.
- oracle problem - mechanism to know if output correct
- metamorphic relations - reshuffle imput expect same output, slight modifications of inputs, to solve he oracle problem.
- Metamorphic testing tool (2014 publication).

### 11:45 – 12:00 Xiaorou Guo : Ratio-based Quartet DNA methylation reference datasets for evaluating CpG calling performance
- Cytosine methylation
- Methylation calling - methylation percentage
- Multi Omics Quartet Project Reference Material

### 12:00 – 12:15 Hakime Öztürk : Benchmarking privacy preserving generative models for biological data
benchmarks.esla-ai.eu health privacy challenge - camda 2025 

# On reflection

- We are very much on track with proteobench compared with other benchmarks


- community angagement : defining benchmark, data, scores, communicating with developers
- replicability of benchmarks - who runs the software
  -  centralized - one infrastructure
  -  decentralized - run benchmark locally - submit results
- multiple scores - often redundant - need of end users to have a single easy to understand score is recognized
- datasets
  - similarity of datasets used to real-datasets
  - do they capture biological or technical variation
  - what is the ground truth
  - simulated dataset, and why sometimes it is not possible to simulate
- separation of concern
  - those assing software are not the same as developing it
- Actuality - once benchmark is published it might already be outdated
  - Methods and Software is changing
  - software packages get updated
- other
  - data privacy
  - simulation of data (I guess we con not simulte data)
  - metamorphic test



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
  
https://github.com/mritchielab/SpatialBenchVisium

