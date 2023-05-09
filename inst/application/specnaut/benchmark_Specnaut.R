library(tidyverse)
library(prolfquapp)
library(protriple)

xx <- list_benchmark_data()
specnautxx <- xx[grepl("spectronaut", names(xx))]
xxspecnaut <- download_benchmark_data(specnautxx, outdir = tempdir())
fastaxx <- xx[grepl("FASTA", names(xx))]
xxfasta <- download_benchmark_data(fastaxx, outdir = tempdir())

fasta <- xxfasta[[1]][[1]]
fastadb <- prozor::readPeptideFasta(fasta)

inputdir <- xxspecnaut[[1]][[4]]
zipdir <- gsub(".zip", "", basename(inputdir))

benchresults <- file.path(".", "benchresults")
dir.create(benchresults)
GRP2 <- prolfquapp::make_DEA_config(ZIPDIR = file.path(benchresults, paste0("specnaut_",zipdir)))
GRP2$pop$transform = "none"
###
dir.create(GRP2$zipdir)
###
# reading foreign data
REPEATED <- TRUE

file <- grep(".xls",unzip(inputdir, list = TRUE)$Name, value = TRUE)
prec <- read_tsv(unz(inputdir, filename = file))

peptide <- sanitize_specnaut(prec)
peptide$reference <- grepl("HUMAN", peptide$protID)

prot_annot <- prolfquapp::dataset_protein_annot(
  peptide,
  c("protein_Id" = "protID"),
  protein_annot = "PG.ProteinDescriptions",
  more_columns = c("PG.ProteinAccessions","nrPeptides", "reference"))

GRP2$pop$internal <- prot_annot |> filter(reference == TRUE)
GRP2$pop$transform = "robscale"


annot <- data.frame(raw.file = peptide$R.FileName |> unique())
annot <- annot |> mutate(Name = gsub(".+_LFQ", "LFQ", raw.file))
annot <- annot |> mutate(GroupingVar = case_when(grepl("_A_", Name) ~ "A", TRUE ~ "B"))
annot$CONTROL <- ifelse(annot$GroupingVar == "A", "C", "T")

annot$raw.file[ !annot$raw.file %in% sort(unique(peptide$raw.file)) ]
nr <- sum(annot$raw.file %in% sort(unique(peptide$raw.file)))
logger::log_info("nr : ", nr, " files annotated")

peptide <- dplyr::inner_join(annot, peptide, multiple = "all")
peptide$identScore <- -log10(peptide$Qvalue)
GRP2 <- prolfquapp::dataset_extract_contrasts(annot, GRP2)

atable <- prolfqua::AnalysisTableAnnotation$new()
atable$fileName = "raw.file"
atable$hierarchy[["protein_Id"]] <- c("protID")
atable$hierarchy[["peptide_Id"]] <- c("EG.StrippedSequence")
atable$set_response("Quantity")
atable$ident_qValue <- "Qvalue"
atable$ident_Score <- "identScore"
atable$hierarchyDepth <- 1

res <- prolfquapp::dataset_set_factors(atable, peptide)
atable <- res$atable
atable$factor_keys()

peptide <- res$msdata


# Preprocess data - aggregate proteins.
config <- prolfqua::AnalysisConfiguration$new(atable)
adata <- prolfqua::setup_analysis(peptide, config)

lfqdata <- prolfqua::LFQData$new(adata, config)

lfqdata$remove_small_intensities()
GRP2$pop$nrPeptides <- 1
logger::log_info("AGGREGATING PEPTIDE DATA!")

lfqdata <- prolfquapp::aggregate_data(lfqdata, agg_method = GRP2$pop$aggregate)
logger::log_info("data aggregated: {GRP2$pop$aggregate}.")
logger::log_info("END OF DATA TRANSFORMATION.")

prot_annot <- prolfqua::ProteinAnnotation$new(lfqdata = lfqdata, prot_annot)

prolfquapp::copy_DEA_FragPipe_DIA()
grp <- prolfquapp::generate_DEA_reports(lfqdata, GRP2, prot_annot)

prolfquapp::render_DEA(grp[[1]], outpath = GRP2$zipdir, htmlname = "TestTheBest")

for (i in seq_along(grp)) {
  prolfquapp::write_DEA_all(grp[[i]], names(grp)[i], GRP2$zipdir , boxplot = FALSE)
}

