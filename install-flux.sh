#!/bin/bash
# Flux Deployment Script

# Install Flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash

# Verify Flux installation
flux version

# Bootstrap Flux in the cluster
flux bootstrap git \
  --url=https://github.com/YOUR_GITHUB_USERNAME/k3s-flux-lab \
  --branch=main \
  --path=./clusters/my-cluster
