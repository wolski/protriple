#cut  -f1-29 triple_prot.report-lib.tsv > triple_prot.report-lib.fix.tsv


filename <- "TripleProt_Grad30_staggered_FP20_SpecLibDefaults_demultiplex10pmm_library.tsv"
filename <- "TripleProt_Grad90_staggered_FP20_SpecLibDefault_demultiplex_10ppm_library.tsv"
filename <- "TripleProt_Grad90_NOT_stag_FP20_SpecLibDefault_demultiplex_10ppm_library.tsv"

FPlib <- as.data.frame(fread(filename))
tools::file_path_sans_ext(filename)

# Minimal column set for DIANN
mustHave <- c("PrecursorMz","ProductMz","PeptideSequence","PrecursorCharge",
"LibraryIntensity","FragmentType","FragmentCharge","FragmentSeriesNumber",
"FragmentLossType", "ModifiedPeptideSequence","NormalizedRetentionTime")


FPlibMin <- FPlib |> dplyr::select(mustHave)
FPlibMin <- FPlib |> dplyr::mutate(NormalizedRetentionTime = NormalizedRetentionTime * 2) # rescale 1:100 to 1:200 range.
readr::write_tsv(FPlibMin, file = paste0(tools::file_path_sans_ext(filename), "_MIN.tsv"))


FPlibXC <- FPlib |> dplyr::select(mustHave,
                                  FullUniModPeptideName = ModifiedPeptideSequence,
                                  ModifiedPeptide = ModifiedPeptideSequence,
                                  PeptideGroupLabel = ModifiedPeptideSequence,
                                  Tr_recalibrated = NormalizedRetentionTime,
                                  IonMobility = PrecursorIonMobility,
                                  ProteinGroup = ProteinId,
                                  Genes = GeneName,
                                  ProteinName = ProteinId)
FPlibXC <- FPlibXC |> dplyr::mutate(Tr_recalibrated = Tr_recalibrated * 2) # rescale 1:100 to 1:200 range.

readr::write_tsv(FPlibXC, file = paste0(tools::file_path_sans_ext(filename), "_MAX.tsv"))
