library(tidyverse)
library(prolfquapp)
library(prozor)
library(protriple)

xx <- list_benchmark_data()

if (FALSE) {
  specnautxx <- xx[grepl("DIANN", names(xx))]
  fastaxx <- xx[grepl("FASTA", names(xx))]

  xxspecnaut <- download_benchmark_data(specnautxx, outdir = tempdir())
  xxfasta <- download_benchmark_data(fastaxx, outdir = tempdir())
} else {
  xxspecnaut <-
}

fasta <- xxfasta[[1]][[1]]
fastadb <- prozor::readPeptideFasta(fasta)

length(xxspecnaut[[2]])
inputdir <- xxspecnaut[[2]][[2]]


prefix <- basename(dirname(inputdir))
zipdir <- paste0(prefix, "_",gsub(".zip|.tar.gz", "", basename(inputdir)))

benchresults <- file.path(".", "benchresults")
dir.create(benchresults)

params <- prolfquapp::make_DEA_config_R6(
  ZIPDIR = file.path(benchresults, zipdir),
  Normalization = "robscale")

###
dir.create(params$zipdir)

###
# reading foreign data
REPEATED <- TRUE


if (grepl(".zip$", inputdir)) {
  diann.path <- grep("diann-output.tsv", unzip(inputdir,list = TRUE)$Name, value = TRUE)
  ds_file <-  grep("annotation.txt", unzip(inputdir,list = TRUE)$Name, value = TRUE)

  diann.path <- unz(inputdir, filename  = diann.path)
  ds_file <- unz(inputdir, filename  = ds_file)
} else if ( grepl("tar.gz$", inputdir)) {
  library(archive)
  diann.path <- grep("diann-output.tsv", untar(inputdir,list = TRUE), value = TRUE)
  ds_file <-  grep("annotation.txt", untar(inputdir,list = TRUE), value = TRUE)

  diann.path <- archive_read(inputdir, file = diann.path)
  ds_file <- archive_read(inputdir, file  = ds_file)
} else {
  stop("extension unsupported")
}

annot <- read.csv(ds_file)
annot <- data.frame(lapply(annot, as.character))

peptide <- read_DIANN_output(
  diann.path = diann.path,
  fasta.file = fasta,
  nrPeptides = params$processing_options$peptides_nr,
  Q.Value = 0.1)

peptide$reference <- grepl("HUMAN", peptide$fasta.id)
mean(peptide$reference)

prot_annot <- prolfquapp::dataset_protein_annot(
  peptide,
  c("protein_Id" = "Protein.Group"),
  protein_annot = "fasta.header",c("nrPeptides", "fasta.id", "reference"))

GRP2 <- list()
GRP2$params <- params
GRP2$internal <- prot_annot |> dplyr::filter(reference == TRUE)
GRP2$internal |> nrow()


GRP2 <- prolfquapp::dataset_extract_contrasts(annot, GRP2)
annot$raw.file[ !annot$raw.file %in% sort(unique(peptide$raw.file)) ]
nr <- sum(annot$raw.file %in% sort(unique(peptide$raw.file)))
logger::log_info("nr : ", nr, " files annotated")
annot$Relative.Path <- NULL

peptide <- dplyr::inner_join(annot, peptide, multiple = "all")
annotPep <- peptide

atable <- prolfqua::AnalysisTableAnnotation$new()
atable$fileName = "raw.file"
atable$hierarchy[["protein_Id"]] <- c("Protein.Group")
atable$hierarchy[["peptide_Id"]] <- c("Stripped.Sequence")
atable$set_response("Peptide.Quantity")
atable$hierarchyDepth <- 1

res <- prolfquapp::dataset_set_factors(atable, peptide)
atable <- res$atable
peptide <- res$msdata

# Preprocess data - aggregate proteins.
config <- prolfqua::AnalysisConfiguration$new(atable)
adata <- prolfqua::setup_analysis(peptide, config)


lfqdata <- prolfqua::LFQData$new(adata, config)
lfqdata$remove_small_intensities()
logger::log_info("AGGREGATING PEPTIDE DATA!")

lfqdata <- prolfquapp::aggregate_data(lfqdata, agg_method = GRP2$pop$aggregate)
logger::log_info("data aggregated: {GRP2$pop$aggregate}.")
logger::log_info("END OF DATA TRANSFORMATION.")
prot_annot <- prolfqua::ProteinAnnotation$new(lfqdata = lfqdata, prot_annot)


prolfquapp::copy_DEA_DIANN()
grp <- prolfquapp::generate_DEA_reports(lfqdata, GRP2, prot_annot)
prolfquapp::render_DEA(grp[[1]], outpath = GRP2$zipdir, htmlname = "TestTheBest")

for (i in seq_along(grp)) {
  prolfquapp::write_DEA_all(grp[[i]], names(grp)[i], GRP2$zipdir , boxplot = FALSE)
}

if (FALSE) {
  fasta <- prozor::readPeptideFasta(fasta.file[1])
  pepinfo <- data.frame(peptideSeq = unique(annotPep$Stripped.Sequence))
  dim(pepinfo)

  annotPep <- prozor::annotatePeptides(pepinfo = pepinfo, fasta = fasta)
  annotPep$proteinID |> unique() |> length()
  dd <- prepareMatrix(res, peptideID = "peptideSeq" )

  prozor:::.greedy2
  undebug(greedy)
  res <- greedy(dd)
  x <- tibble(protein = unlist(res), peptide = names(res))
  length(unique(x$protein))

  xn <- x |> dplyr::group_by(protein) |> dplyr::summarize(n = n(),.groups = "drop")
  xn <- xn |> filter(n > 1)
  xn$protein |> unique() |> length()
}

