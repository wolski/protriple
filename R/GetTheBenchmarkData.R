

extract_subfolders <- function(url){
  tables <- rvest::read_html(url) |> rvest::html_table()
  folders <- tables[[1]]
  subfolders <- folders$Name
  subfolders <- subfolders[3:(length(subfolders) - 1)]
  urls <- file.path(url, subfolders)
  return(urls)
}



downloadBenchmarks <- function(url,  outdir = "."){
  tmp <- extract_subfolders(url)
  names(tmp) <- basename(tmp)
  xx <- lapply(tmp, extract_subfolders)

  for (i in seq_along(xx)) {
    dirName <- names(xx)[i]
    dirName <- file.path(outdir, dirName)
    dir.create(dirName)
    print(dirName)
    lapply(xx[[i]], function(x){
      cat("in :", x, "\n");
      cat("to :", file.path(dirName,  basename(x)), "\n");
      download.file(x, file.path(dirName,  basename(x)))
    })
  }

}

