# myRdocs

This package provides templates for R generated documents. The contents are modifications of other people's work (see credits section below).

## Install Instructions
To install myRdocs and its dependencies run:
```r
install.packages('devtools')
devtools::install_github('ChrisDienes/myRdocs')
```

## Usage

**R markdown template:** Create a new R markdown file inside of RStudio by going to _File > New File > R Markdown... > From Template_ and then select either _myRdocs stater template (HTML)_ or _myRdocs material design (HTML)_ from the template options. Once the template file opens, click the RStudio `knit` button to render the template document.  

**Latex Report template:** Set the desired working directory and run:
```r
# Check current directory:
getwd()
### If you want to change directory:
# setwd(...path...)
### Create folder and template report:
myRdocs::report_template()
```

## Credits

- The R markdown templates are modifications of the [rmdformats package](https://github.com/juba/rmdformats)

