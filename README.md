# myRdocs

This package provides templates for R generated documents. The contents are modifications of other people's work (see credits section below).

## Install Instructions
To install myRdocs and its dependencies run:
```r
install.packages('devtools')
devtools::install_github('ChrisDienes/myRdocs')
```

## Usage

**R markdown template:** Create a new R markdown file by selecting the myRdocs material design from the template dialog box.

**Latex Report template:** Set the desired working directory and run:
```r
# Check current directory:
getwd()
### If you want to change directory:
# setwd(...path...)
### Create folder and template report:
report_template()
```

## Credits

- The R markdown templates are modifications of the [rmdformats package](https://github.com/juba/rmdformats)

