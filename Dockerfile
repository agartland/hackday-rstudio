FROM rocker/tidyverse:4.2.3

# update libraries
RUN apt-get -y update

# non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# install R libraries needed for analysis
# COPY R/r_package_installs.R /home/lib/r_package_installs.R
# RUN chmod +x /home/lib/r_package_installs.R && /home/lib/r_package_installs.R
# RUN rm /home/lib/r_package_installs.R
# Seurat, GGally, tidygraph, WGCNA, fgsea, pheatmap, tmod, msigdbr, ggbeeswarm, ggExtra, ggrepel, igraph, patchwork

RUN Rscript -e 'install.packages("Seurat", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("edgeR", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("GGally", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("tidygraph", repos="https://cran.rstudio.com")'

RUN Rscript -e 'install.packages("ggplot2", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("pheatmap", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("tmod", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("msigdbr", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggbeeswarm", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggExtra", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggrepel", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("igraph", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("patchwork", repos="https://cran.rstudio.com")'


RUN Rscript -e 'if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")'

RUN Rscript -e 'BiocManager::install("limma")'
RUN Rscript -e 'BiocManager::install("DESeq2")'
RUN Rscript -e 'BiocManager::install("impute")'
RUN Rscript -e 'BiocManager::install("preprocessCore")'
RUN Rscript -e 'BiocManager::install("GO.db")'
RUN Rscript -e 'BiocManager::install("fgsea")'

RUN Rscript -e 'devtools::install_github("BIGslu/kimma")'

# WGCNA has depencies in bioconductor
RUN Rscript -e 'install.packages("WGCNA", repos="https://cran.rstudio.com")'

RUN apt-get install nano

RUN Rscript -e 'install.packages("statmod", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggpubr", repos="https://cran.rstudio.com")'
