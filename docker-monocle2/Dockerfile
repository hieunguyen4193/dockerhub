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
CMD ["R", "--version"]