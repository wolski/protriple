#' massage spectronaut table
#'
#' select columns, count peptides (stripped sequences per protein), summarize FG.Quantity
#' @export
#'
sanitize_specnaut <- function(prec) {
  requiredColumns <- c(
    "R.FileName",
    "PG.ProteinAccessions",
    "PG.ProteinDescriptions",
    "EG.StrippedSequence",
    "EG.ModifiedSequence",
    "EG.PrecursorId",
    "EG.Qvalue",
    "FG.Quantity")

  stopifnot(all(requiredColumns %in% colnames(prec)))

  prec <- prec |> select(!!!syms(requiredColumns))

  prec <- prec |> tidyr::separate(PG.ProteinAccessions, "protID", sep=";", remove=FALSE)

  prec <- prec |> filter(FG.Quantity > 50)

  peptide <- prec |>
    group_by(R.FileName, PG.ProteinAccessions, protID, PG.ProteinDescriptions, EG.StrippedSequence) |>
    summarize(n = n(), Quantity = sum(FG.Quantity, na.rm = TRUE), Qvalue = min(EG.Qvalue, na.rm = TRUE)) |>
    ungroup()

  nrpepprot <- peptide |>
    select(PG.ProteinAccessions, EG.StrippedSequence) |>
    distinct() |>
    group_by(PG.ProteinAccessions) |>
    summarize(nrPeptides = n())
  peptide <- inner_join(nrpepprot, peptide, multiple = "all")
  peptide$raw.file <- peptide$R.FileName
  return(peptide)

}
