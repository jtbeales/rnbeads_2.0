FROM bioconductor/bioconductor_docker:RELEASE_3_10

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

RUN Rscript -e 'BiocManager::install(c("Biobase", "biomaRt", "RnBeads", "RnBeads.hg19"))'
