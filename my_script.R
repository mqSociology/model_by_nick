install.packages("blogdown")
install.packages("devtools")
install.packages("rmarkdown")
install.packages("formatR")
# run the install.packages first, and then run the second lot of code below

library(blogdown)
library(devtools)
library(rmarkdown)
library(formatR)
blogdown::install_hugo()
blogdown::install_theme(theme = "gcushen/hugo-academic")
blogdown::serve_site()
