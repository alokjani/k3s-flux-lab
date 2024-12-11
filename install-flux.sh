#!/bin/bash
# Flux Deployment Script

# Install Flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash

# Verify Flux installation
flux version

# Bootstrap Flux in the cluster
flux bootstrap git \
  --url=ssh://git@github.com/alokjani/k3s-flux-lab \
  --private-key-file=id_rsa \
  --branch=main \
  --path=./clusters/{cluster_name}
