#cut  -f1-29 triple_prot.report-lib.tsv > triple_prot.report-lib.fix.tsv

input_file <- "triple_prot.report-lib.fix.tsv"

report_lib_min_tsv <- fread(input_file, nrows= 1000000)
report_lib_min_tsv <- as.data.frame(report_lib_min_tsv)
View(report_lib_min_tsv)

FPlib <- as.data.frame(fread("TripleProt_Grad30_staggered_FP20_SpecLibDefaults_demultiplex10pmm_library.tsv"))

names(FPlib)[names(FPlib) %in% names(report_lib_min_tsv)]

# Minimal column set for DIANN
mustHave <- c("PrecursorMz","ProductMz","PeptideSequence","PrecursorCharge",
"LibraryIntensity","FragmentType","FragmentCharge","FragmentSeriesNumber",
"FragmentLossType", "ModifiedPeptideSequence","NormalizedRetentionTime")


# ModifiedPeptide LabeledSequence FullUniModPeptideName tg_moleculeId "FullUniModPeptideName" modification_sequence
# ERROR: C:\diann\src\diann.cpp: 19427: Cannot load spectral library
# iRT iRT RetentionTime NormalizedRetentionTime Tr_recalibrated eg_iRT "Tr_recalibrated" RT_detected

FPlibMin <- FPlib |> dplyr::select(mustHave)
readr::write_tsv(FPlibMin, file = "minTripleProt_Grad30_staggered_FP20_SpecLibDefaults_demultiplex10pmm_library.tsv")

FPlibXC <- FPlib |> dplyr::select(mustHave,FullUniModPeptideName = ModifiedPeptideSequence,
ModifiedPeptide = ModifiedPeptideSequence,
PeptideGroupLabel = ModifiedPeptideSequence,
Tr_recalibrated = NormalizedRetentionTime,
IonMobility = PrecursorIonMobility,
ProteinGroup = ProteinId,
Genes = GeneName,
ProteinName = ProteinId)

FPlibXC <- FPlibXC |> dplyr::mutate(Tr_recalibrated = Tr_recalibrated * 2)
readr::write_tsv(FPlibXC, file = "maxTripleProt_Grad30_staggered_FP20_SpecLibDefaults_demultiplex10pmm_library.tsv")


tt <- names(FPlib)[!names(FPlib) %in% names(report_lib_min_tsv)]
head(FPlib[,tt])

head(report_lib_min_tsv[,!names(report_lib_min_tsv) %in% names(FPlib)])
