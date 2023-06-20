# Set R repository
options(repos = list(CRAN = 'https://cloud.r-project.org/'))

# Install packages not present in the Docker image by default
install.packages("extrafont")
install.packages("heatmaply")
install.packages("ggrepel")
install.packages("reticulate")
install.packages("robustbase")
install.packages("ggnewscale")
install.packages("ggpubr")
install.packages("sp")
install.packages("igraph")
install.packages("dplyr")
install.packages("ggalluvial")
install.packages("umap")
remotes::install_github("jtanevski/mistyR@084c7ce")
devtools::install_github("ricardo-bion/ggradar",dependencies=TRUE)
remotes::install_github("satijalab/seurat", "seurat5", quiet = TRUE)
