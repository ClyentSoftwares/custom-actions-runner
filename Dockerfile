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
    software-properties-common

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Clean up APT cache and temporary files
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to runner user
USER runner
