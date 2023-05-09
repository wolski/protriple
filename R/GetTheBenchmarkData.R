

extract_subfolders <- function(url){
  tables <- rvest::read_html(url) |> rvest::html_table()
  folders <- tables[[1]]
  subfolders <- folders$Name
  subfolders <- subfolders[3:(length(subfolders) - 1)]
  urls <- file.path(url, subfolders)
  return(urls)
}


#' download benchmark datasets to outdir which must exist
#' @param url data to benchmark http://fgcz-ms.uzh.ch/~wolski/protriple_DIA_data/"
#' @param outdir destination folder
#' @param simulate default FALSE (download data)
#' @export
#' @example
#' downloadBenchmarks(simulate = FALSE, outdir = tempdir())
downloadBenchmarks <- function(
    url = "http://fgcz-ms.uzh.ch/~wolski/protriple_DIA_data/",
                               outdir = ".",
    simulate = FALSE){
  if (!dir.exists(outdir)) {
    stop(paste0("No directory :",outdir))
  }
  tmp <- extract_subfolders(url)
  names(tmp) <- basename(tmp)
  xx <- lapply(tmp, extract_subfolders)

  for (i in seq_along(xx)) {
    dirName <- names(xx)[i]
    dirName <- file.path(outdir, dirName)
    cat("Dirname : ", dirName, "\n")
    dir.create(dirName)
    lapply(xx[[i]], function(x){
      cat("in :", x, "\n");
      cat("to :", file.path(dirName,  basename(x)), "\n");

      if (!simulate) {
        cat("Downloading ...\n")
        download.file(x, file.path(dirName,  basename(x)))
      }
    })
  }

}

