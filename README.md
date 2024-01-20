# auto-cv

Installation Quirks:

- See https://yihui.org/tinytex/r/#debugging for general debugging tips if there are problems converting RMarkdown into LaTeX into PDF.

- The fontspec package requires either XeTeX or LuaTeX. For Macs, you should first install MacTex (https://tug.org/mactex/mactex-download.html). Then, in RStudio, you must go to Preferences or Tools/Project Options and under the "Sweave" tab, change "Typeset LaTeX into PDF using" to "XeLaTex".