FROM rocker/rstudio:3.6.3

# RUN rm -rf /etc/apt/sources.list && 
#
# The reason sudo apt update is failing is that Debian 10 (Buster) has reached its End-of-Life (EOL) 
# for standard support, meaning the official repositories have been archived.
# To still run apt update and install packages inside your Docker container, 
# you must change your APT source list to point to the Debian Archive mirror.
# You need to modify the /etc/apt/sources.list file inside your Docker container 
# to replace the standard mirrors (deb.debian.org and security.debian.org) 
# with the archive mirror (archive.debian.org).

COPY ./sources.list /etc/apt/sources.list 
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