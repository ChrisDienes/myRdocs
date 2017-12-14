#' Generate Latex Report Template.
#'
#' @details Creates a folder under \code{getwd()} named \code{report_Sys.Date()}. Folder contains file \code{report.Rnw} which is automatically opened in the editor. 
#' @examples
#' # setwd(...path...)
#' # report_template()
#' @export

report_template = function(){
  path = paste0(getwd(),"/report_",gsub("-","_",Sys.Date()))
  if(dir.exists(path)){
    stop(paste0("ERROR: Not allowed to overwrite existing directory at ", path))
  } else {
    whiletest = TRUE 
    while(whiletest){
      cat(paste0("Create a report directory here:\n",path))
      a = readline("(y/n):  ")
      if(!(a %in% c("y", "Y", "n", "N"))){
        cat("ERROR: Input must be one of: y, Y, n, or N.\n")
      } else {
        whiletest = FALSE
      }
    }
    if(a %in% c("y","Y")){
      dir.create(path = path)
      file_name = paste0(path, "/report.Rnw")
      fileConn<-file(file_name)
      writeLines(c("% !Rnw weave = knitr",
                   "",
                   "%% R Latex Document",
                   "",
                   "%%%% References contained in file %%%%",
                   "\\RequirePackage{filecontents}",
                   "\\begin{filecontents*}{\\jobname.bib}",
                   "@Book{book1,",
                   "  author    = {bookauthor},",
                   "  title     = {booktitle},",
                   "  edition   = {1},",
                   "  publisher = {NY},",
                   "  location  = {New York, NY.},",
                   "  year      = {1900},",
                   "}",
                   "@article{article1,",
                   "  title   = {articleauthor},",
                   "  author  = {articleauthor},",
                   "  journal = {Journal},",
                   "  year    = {1901},",
                   "  note    = {Available at this url},",
                   "}",
                   "\\end{filecontents*}",
                   "",
                   "\\documentclass[11pt]{article}",
                   "\\setlength{\\textwidth}{6.5in}",
                   "\\setlength{\\textheight}{9in}",
                   "\\setlength{\\oddsidemargin}{0in}",
                   "\\setlength{\\evensidemargin}{0in}",
                   "\\setlength{\\topmargin}{-1.5cm}",
                   "\\setlength{\\parindent}{0cm}",
                   "\\setlength{\\parskip}{1em}",
                   "\\usepackage{amsmath,amsfonts,amsthm} % for latex math stuff",
                   "\\usepackage{color}        % for coloring text",
                   "\\usepackage{hyperref}     % for cross-referencing commands", 
                   "\\usepackage{graphicx}     % for includegraphics",
                   "\\usepackage{float}        % for floating images/tables",
                   "\\usepackage{fancyhdr}     % for fancy header",
                   "\\usepackage{changepage}   % for the adjustwidth environment",
                   "\\newenvironment{adj}{\\begin{adjustwidth}{1.5cm}{}}{\\end{adjustwidth}}",
                   "",
                   "\\begin{document}",
                   "\\fancypagestyle{firststyle}",
                   "{",
                   "   \\fancyhf{}",
                   "   \\cfoot{\\thepage}",
                   "}",
                   "",
                   "%%%% Custom footer %%%%",
                   "%\\fancyfoot[R]{\\raisebox{6.0ex-\\height}{\\includegraphics[width=1.5cm]{logo.jpg}}}",
                   "%\\fancyfoot[L]{\\raisebox{1.2ex-\\height}{COMPANY XYZ CONFIDENTIAL}}",
                   "",
                   "%%%% Load R packages %%%%",
                   "<<echo = FALSE>>==",
                   "library(knitr)",
                   "library(xtable)",
                   "library(ggplot2)",
                   "@",
                   "",
                   "%%%% Latex code: %%%%%",
                   "\\thispagestyle{firststyle}",
                   "\\begin{center}",
                   "{\\sc \\Large Big Title}\\\\",
                   "Subtitle\\\\",
                   "Author 1, Ph.D. and Author 2, Ph.D.\\\\",
                   "\\today",
                   "\\end{center}",
                   "\\noindent\\makebox[\\linewidth]{\\rule{\\textwidth}{0.4pt}}",
                   "",
                   "\\vspace{.5cm}",
                   "\\section{Executive Summary}",
                   "",
                   "This report contains...",
                   "\\begin{itemize}",
                   "  \\item Item 1.",
                   "  \\item Item 2.",
                   "  \\item Item 3.",
                   "\\end{itemize}",
                   "", 
                   "\\section{Methods}",
                   "",
                   "A new section with a citation \\cite{book1}...",
                   "",
                   "\\section{Results}",
                   "",
                   "Example table below...",
                   "",
                   "<<label=tab-iris, echo=FALSE, results='asis'>>=",
                   "# R code:",
                   "data('iris')",
                   "print(xtable(iris[1:10,], caption = 'Iris Data',",
                   "      label = 'tab:iris', align = rep('c',6)), include.rownames=FALSE,",
                   "      table.placement = 'h',caption.placement = 'top',",
                   "      sanitize.text.function=function(x){x})",
                   "@",
                   "",
                   "Example plot below...",
                   "",
                   "\\begin{figure}[h]",
                   "<<echo=FALSE, fig.align='center', out.width='0.5\\\\textwidth', message=FALSE>>=",
                   "df <- data.frame(a= c(1:10), b = c (10:1))",
                   "ggplot(data = df, aes(a, b)) + geom_line()",
                   "@",
                   "\\caption{caption}",
                   "\\end{figure}",
                   "",
                   "\\section{Limitations}",
                   "",
                   "I can't do that...",
                   "",
                   "%%%% References %%%%",
                   "\\nocite{*} % to test all bib entrys",
                   "\\bibliographystyle{plain}",
                   "\\bibliography{\\jobname} % <=== calls bib file created with filecontents!",
                   "",
                   "\\end{document}"), 
                 fileConn)
      close(fileConn)
      file.edit(file_name)
      cat(paste0("Success: Directory created at ", path, 
                 "\nSuccess: Sweave file opened in editor: ", path,"/report.Rnw"))
    } else {
      cat("Aborted: No directory created.")
    }
  }
}
