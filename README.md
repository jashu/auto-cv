# auto-cv

Installation Quirks:

- See https://yihui.org/tinytex/r/#debugging for general debugging tips if there are problems converting RMarkdown into LaTeX into PDF.

- The fontspec package requires either XeTeX or LuaTeX. In RStudio, you must go to Preferences or Tools/Project Options and under the "Sweave" tab, change "Typeset LaTeX into PDF using" to "XeLaTex".

- As of 2021-10-28, the CRAN version of the package `rcrossref` will generate errors. The development version of GitHub must be installed instead as a workaround: "https://github.com/ropensci/rcrossref/issues"