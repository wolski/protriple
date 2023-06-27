#cut -f2,3,4,7,10,19,20,25,26,27 triple_prot.report-lib.tsv > triple_prot.report-lib.min.tsv
# cut  -f1-29 triple_prot.report-lib.tsv > triple_prot.report-lib.fix.tsv

library(prozor)
library(readr)
library(data.table)


input_file <- "triple_prot.report-lib.prosit.csv"
#input_file <- "two_proteomes.report-lib.prosit.csv"
fasta_input <- "fgcz_tripleProteome_HYC_1SpG_20230609.fasta"

prefix <- strsplit(input_file, "\\.")[[1]][1]
prosit <- readr::read_csv(input_file)

if (FALSE) {
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

report_lib_min_tsv <- fread("triple_prot.report-lib.min.tsv")
modseq <- report_lib_min_tsv |> dplyr::select(PeptideSequence, ModifiedPeptide) |> dplyr::distinct()

prosit <- dplyr::inner_join(modseq , prosit,  by = c(PeptideSequence = "peptideSeq") )

readr::write_tsv(prosit, file = paste0(prefix , ".report-lib.prosit.prozor.CE30.tsv"))
prosit$collision_energy <- 25
readr::write_tsv(prosit, file = paste0(prefix , ".report-lib.prosit.prozor.CE25.tsv"))
prosit$collision_energy <- 35
readr::write_tsv(prosit, file = paste0(prefix , ".report-lib.prosit.prozor.CE35.tsv"))


