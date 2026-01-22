FROM rocker/tidyverse:4.4.0

# Set non-interactive mode early
ENV DEBIAN_FRONTEND=noninteractive

# System dependencies - combine into single layer
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        nano \
        cmake \
        libxt-dev \
        libcairo2-dev \
        libv8-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Fix Matrix package (required for some downstream packages)
RUN Rscript -e 'remove.packages("Matrix", lib="/usr/local/lib/R/library")' && \
    Rscript -e 'devtools::install_github("cran/Matrix", dependencies=TRUE)'

# Fix RcppEigen (required for lme4)
RUN Rscript -e 'remove.packages("RcppEigen")' && \
    Rscript -e 'devtools::install_github("RcppCore/RcppEigen", dependencies=TRUE)'

# Install BiocManager and Bioconductor packages
RUN Rscript -e 'if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")' && \
    Rscript -e 'BiocManager::install("impute", ask=FALSE, update=FALSE)'

# Commented out Bioconductor packages - uncomment as needed
# RUN Rscript -e 'BiocManager::install(c("edgeR", "limma", "DESeq2", "preprocessCore", "GO.db", "fgsea"), ask=FALSE, update=FALSE)'

# CRAN packages - consolidated into single install call
RUN Rscript -e 'install.packages(c( \
    "nloptr", \
    "palmerpenguins", \
    "GGally", \
    "tidygraph", \
    "statmod", \
    "pheatmap", \
    "tmod", \
    "ggbeeswarm", \
    "ggExtra", \
    "ggrepel", \
    "igraph", \
    "patchwork", \
    "multcomp", \
    "summarytools", \
    "knitr", \
    "kableExtra", \
    "ggpubr", \
    "ragg" \
), repos="https://cran.rstudio.com")'

# Survival analysis packages
RUN Rscript -e 'install.packages(c( \
    "survival", \
    "survminer", \
    "survRM2", \
    "flexsurv", \
    "rstpm2", \
    "cmprsk", \
    "timereg", \
    "coxme" \
), repos="https://cran.rstudio.com")'

# Clinical trial reporting and table packages
RUN Rscript -e 'install.packages(c( \
    "tableone", \
    "gtsummary", \
    "emmeans", \
    "broom", \
    "gt", \
    "flextable" \
), repos="https://cran.rstudio.com")'

# Commented out CRAN packages - uncomment as needed
# RUN Rscript -e 'install.packages(c("msigdbr", "Seurat", "WGCNA"), repos="https://cran.rstudio.com")'

# GitHub packages (need separate installs due to dependencies)
RUN Rscript -e 'devtools::install_github("lme4/lme4", dependencies=TRUE)'
RUN Rscript -e 'devtools::install_github("ricardo-bion/ggradar", dependencies=TRUE)'

# Commented out GitHub packages - uncomment as needed
# RUN Rscript -e 'devtools::install_github("BIGslu/kimma")'
# RUN Rscript -e 'devtools::install_github("BIGslu/BIGpicture")'