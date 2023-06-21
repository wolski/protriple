#cut -f2,3,4,7,10,19,20,25,26,27 triple_prot.report-lib.tsv > triple_prot.report-lib.min.tsv

library(prozor)
library(readr)
library(data.table)
library(tidyverse)


input_file <- "triple_prot.report-lib.prosit.csv"
fasta_input <- "fgcz_tripleProteome_HYC_1SpG_20230609.fasta"
prefix <- strsplit(input_file, "\\.")[[1]][1]
prosit <- readr::read_csv(input_file)


if (TRUE) {
  upeptide <- unique(prosit$modified_sequence)
  fastaDB <-
    prozor::readPeptideFasta(fasta_input)
  annotAll <- prozor::annotatePeptides(upeptide, fastaDB)
  xx <-
    prepareMatrix(annotAll,
                  proteinID = "proteinID",
                  peptideID = "peptideSeq")

  xxAll <- greedy(xx)

  peptideProtmapping <- tibble::tibble(proteinID = as.character(xxAll), peptideSeq = names(xxAll))
  readr::write_tsv(peptideProtmapping , file = paste0(prefix,".prozorProteinPeptideMapping.tsv"))
} else {
  peptideProtmapping <- readr::read_tsv(file = paste0(prefix,".prozorProteinPeptideMapping.tsv"))
}


prosit <- dplyr::inner_join(peptideProtmapping, prosit, by = c(peptideSeq  = "modified_sequence"))
dim(prosit)


report_lib_min_tsv <- fread("triple_prot.report-lib.min.tsv")

modseq <- report_lib_min_tsv |> select(PeptideSequence, ModifiedPeptide) |> distinct()

dim(modseq)
modseq$ModifiedPeptide <- gsub("\\(","\\[", modseq$ModifiedPeptide)
modseq$ModifiedPeptide <- gsub("\\)","\\]", modseq$ModifiedPeptide)

prosit <- inner_join(modseq , prosit,  by = c(PeptideSequence = "peptideSeq") )

readr::write_tsv(prosit, file = paste0(prefix , ".report-lib.prosit.prozor.tsv"))
head(prosit)
