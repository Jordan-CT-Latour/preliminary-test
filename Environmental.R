#List of the packages needed

packages = c("ggplot2", "dplyr", "wavethresh")

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

#Importing data from Dropbox

df <- read.table("https://www.dropbox.com/s/ltgca5biyom63p5/Environmental.txt?dl=1",
                 header = T,
                 sep = "\t")

#Plotting water temperature


ggplot(data = df[df$depth == "-2", ], aes(date, water_temp, group = 1)) +
  geom_line()


