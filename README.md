# K3s Kubernetes Cluster with Flux

## Prerequisites
- Vagrant
- VirtualBox
- Flux CLI

## Setup Instructions
1. Clone this repository
2. Install Flux CLI: 
   ```
   curl -s https://fluxcd.io/install.sh | sudo bash
   ```
3. Start the cluster:
   ```
   vagrant up
   ```
4. Access the cluster:
   ```
   # Copy kubeconfig from VM
   cp vagrant/kubeconfig ~/.kube/config
   
   # Install Flux
   ./install-flux.sh
   ```

## Deploying Applications
Place Kubernetes manifests in the ./clusters/my-cluster directory and commit to see Flux automatically sync.
