library(tidyverse)
library(rorcid)
path <- "~/Box/2021-2022 Faculty CVs/"
render_report = function(orcid, email, path){
  person <- orcid_person(orcid)[[1]]
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  # Start CV 3 years prior to current year
  start_year <- current_year - 3L
  all_works <- works(orcid) %>% 
    as_tibble() %>%
    mutate(year = as.integer(`publication-date.year.value`)) %>%
    filter(year >= start_year)
  types <- all_works$type
  class(all_works) <- c(class(all_works), "works")
  params <- list(
    name = person$name$`given-names`,
    surname = person$name$`family-name`,
    email = email,
    orcid = orcid,
    all_works = all_works,
    types = types
  )
  output_file = paste0(
    path,
    "CV-", 
    params$name,
    "-", 
    params$surname,
    ".pdf"
  )
  if("patent" %in% types){
    try(
      rmarkdown::render(
        "faculty-eval-last3yrs-patents.Rmd", 
        params = params,
        output_file = output_file
      ),
      outFile = gsub("pdf", "txt", output_file)
    )
  } else {
    try(
      rmarkdown::render(
        "faculty-eval-last3yrs.Rmd", 
        params = params,
        output_file = output_file
      ),
      outFile = gsub("pdf", "txt", output_file)
    )
  }
}
faculty <- read_csv(paste(path, "*Faculty ORCID IDs.csv", sep = ""))
walk2(
  faculty$OrcidID, 
  faculty$email,
  render_report,
  path = path
)
