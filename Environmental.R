#List of the packages needed

packages = c("ggplot2", "dplyr", "tidyr", "RCurl")

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

#Importing data from FTP

df <- read.csv(text = getURL("ftp://9805231@140.112.68.181/Data_analyses_Jordan/Environmental.csv",
                             userpwd = "9805231:Jo199672La",
                             connecttimeout = 60)
               )

#Plotting environmental data at 2m depth

df_long <- pivot_longer(df[df$depth == "-2", ], !date, names_to = "env_var", values_to = "value")

ggplot(data = df_long[, -"date_julian"], aes(as.Date(date), value, group = 1)) +
  geom_line() +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  facet_wrap(~ env_var)

