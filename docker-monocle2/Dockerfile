# Start from the base Ubuntu 22.04 image
FROM ubuntu:22.04

# Set environment variable to suppress interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Define the R version and source file
ENV R_VERSION=3.6.3
ENV R_SOURCE=R-${R_VERSION}.tar.gz

# 1. Install all necessary dependencies for building R from source
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libreadline-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libpcre3-dev \
    liblzma-dev \
    libbz2-dev \
    libxt-dev \
    wget \
    zlib1g-dev \
    ca-certificates

# 2. Download, extract, and configure R source
RUN wget https://cran.r-project.org/src/base/R-3/${R_SOURCE} -P /tmp && \
    tar -xzf /tmp/${R_SOURCE} -C /tmp && \
    rm /tmp/${R_SOURCE}

# 3. Compile and install R
# We use --with-pcre1-config to ensure compatibility with older R versions
# on newer Ubuntu releases which use PCRE2 by default.
WORKDIR /tmp/R-${R_VERSION}
RUN ./configure \
    --enable-R-shlib \
    --enable-memory-profiling \
    --with-pcre1-config \
    --with-x=no && \
    make && \
    make install

# 4. Clean up installation files to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Verify the R version
# CMD ["R", "--version"]

# INSTALL R PACKAGES
RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt install libudunits2-dev libgdal-dev libgeos-dev libproj-dev libfontconfig1-dev -y
RUN apt-get clean all && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    libhdf5-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    libxt-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libglpk40 \
    libgit2-dev \
  && apt-get clean all && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt install libfontconfig1-dev 
RUN apt-get update && apt-get install libmagick++-6.q16-dev -y

RUN mkdir -p /home/hieunguyen
RUN mkdir -p /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/Archive/VGAM/VGAM_1.0-6.tar.gz -P /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/Archive/Matrix/Matrix_1.3-0.tar.gz -P /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/Archive/fastICA/fastICA_1.2-1.tar.gz -P /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/Archive/FNN/FNN_1.0.tar.gz -P /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/densityClust_0.3.3.tar.gz -P /home/hieunguyen/download_src
RUN wget https://cran.r-project.org/src/contrib/Archive/XML/XML_3.98-1.9.tar.gz -P /home/hieunguyen/download_src



COPY ./install_R_packages.R /home/hieunguyen/download_src
RUN Rscript /home/hieunguyen/download_src/install_R_packages.R