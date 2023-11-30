FROM rocker/tidyverse:4.2.3

# update libraries
RUN apt-get -y update

# non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# install R libraries needed for analysis
# COPY R/r_package_installs.R /home/lib/r_package_installs.R
# RUN chmod +x /home/lib/r_package_installs.R && /home/lib/r_package_installs.R
# RUN rm /home/lib/r_package_installs.R
# limma, kimma, Seurat, GGally, tidygraph, DESeq2, wcgna, fgsea, pheatmap, tmod, msigdbr, ggbeeswarm, ggExtra, ggrepel, igraph, patchwork
RUN Rscript -e 'install.packages("limma", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("kimma", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("Seurat", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("GGally", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("tidygraph", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("DESeq2", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("wcgna", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggplot2", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("fgsea", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("pheatmap", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("tmod", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("msigdbr", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggbeeswarm", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggExtra", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("ggrepel", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("igraph", repos="https://cran.rstudio.com")'
RUN Rscript -e 'install.packages("patchwork", repos="https://cran.rstudio.com")'
