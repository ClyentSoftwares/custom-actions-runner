FROM ghcr.io/actions/actions-runner:2.319.1

# Switch to root user to install additional packages
USER root

# Update package list and install essential tools
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    git \
    git-lfs \
    jq \
    zip \
    unzip \
    build-essential \
    software-properties-common \
    libssl-dev \
    libudev-dev \
    libclang-dev \
    pkg-config

# Enable 32-bit architecture
RUN dpkg --add-architecture i386

# Update package list again after adding i386 architecture
RUN apt-get update

# Install Wine
RUN apt-get install -y \
    wine \
    wine32 \
    wine64

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" && \
    unzip -qq awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Clean up APT cache and temporary files
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to runner user
USER runner

# Install Rustup and Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set PATH for Rust
ENV PATH="/home/runner/.cargo/bin:${PATH}"
