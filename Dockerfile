FROM r-base:3.6.3

RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    ghostscript
ENV PATH=pkg-config:$PATH

RUN install2.r --error --deps TRUE \
    doParallel \
    && rm -rf /tmp/downloaded_packages/

RUN Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager"); BiocManager::install("Biobase"); BiocManager::install("biomaRt"); BiocManager::install("RnBeads"); BiocManager::install("RnBeads.hg19");'
