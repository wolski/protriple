library(prozor)
library(readr)
library(data.table)
library(tidyverse)

rm(list = ls())

prosit <- readr::read_csv("two_proteomes.report-lib.prosit.csv")


if (TRUE) {
  upeptide <- unique(prosit$modified_sequence)


  fastaDB <-
    prozor::readPeptideFasta("fgcz_twoProteome_HY_1SpG_20230609.fasta")
  annotAll <- prozor::annotatePeptides(upeptide, fastaDB)
  xx <-
    prepareMatrix(annotAll,
                  proteinID = "proteinID",
                  peptideID = "peptideSeq")

  xxAll <- greedy(xx)

  peptideProtmapping <- tibble::tibble(proteinID = as.character(xxAll), peptideSeq = names(xxAll))
  readr::write_tsv(peptideProtmapping , file = "two_proteome_prozorProteinPeptideMapping.tsv")
} else {
  peptideProtmapping <- readr::read_tsv(file = "two_proteome_prozorProteinPeptideMapping.tsv")
}

prosit <- dplyr::inner_join(peptideProtmapping, prosit, by = c(peptideSeq  = "modified_sequence"))
dim(prosit)


report_lib_min_tsv <- fread("report-lib.min.tsv")
modseq <- report_lib_min_tsv |> select(PeptideSequence, ModifiedPeptide) |> distinct()
dim(modseq)
prosit <- inner_join(modseq , prosit,  by = c(PeptideSequence = "peptideSeq") )

readr::write_tsv(prosit, file = "two_prot.report-lib.prosit.prozor.tsv")
head(prosit)
