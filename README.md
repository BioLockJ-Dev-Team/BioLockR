# BioLockR
**R package - the official R wrappers to interact with the BioLockJ java program from an R session.**

The primary motivation for this package is to facilitate an R shiny application, which serves as a GUI for BioLockJ.

This package offeres an interface for interacting with the BioLockJ java program, it _does NOT include_ the BioLockJ java program.  
That must installed separately, see [BioLockJ - Getting Started](https://biolockj-dev-team.github.io/BioLockJ/Getting-Started/)

### Getting Started
The package has not been submitted to CRAN.
You can install it using the `install_gethub()` command from devtools:
```r
# install.packages("devtools")
library("devtools")
install_github("BioLockJ-Dev-Team/BioLockR")
```

Launch the interactive setup mode:
```r
library("BioLockR")
setup_BioLockR()
```

BioLockR will remember these settings for future sessions.  The setup can also be done non-interactively, see `?setup_BioLockR()` .
