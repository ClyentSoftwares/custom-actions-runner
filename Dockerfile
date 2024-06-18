FROM ghcr.io/actions/actions-runner:latest

# Switch to root user to install additional packages
USER root

# Update package list and install essential tools
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    git \
    jq \
    unzip \
    software-properties-common \
    libssl-dev \
    libudev-dev

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" && \
    unzip -qq awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Install Rustup and Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set PATH for Rust
ENV PATH="/root/.cargo/bin:${PATH}"

# Clean up APT cache and temporary files
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to runner user
USER runner
