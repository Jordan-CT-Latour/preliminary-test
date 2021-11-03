#List of the packages needed

packages = c("repmis")

#Installing and loading packages of the list "packages" if needed

package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

#Importing data from DropBox

df <- read.table("https://www.dropbox.com/s/ltgca5biyom63p5/Environmental.txt?dl=1",
                 header = T,
                 sep = "\t")
