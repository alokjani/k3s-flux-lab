# Vagrantfile for K3s Kubernetes Cluster
Vagrant.configure("2") do |config|
  # Global VM configuration
  config.vm.box = "ubuntu/jammy64"
  
  # Number of nodes
  MASTER_NODES = 1
  WORKER_NODES = 2

  # Shared VM configuration
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048 
    vb.cpus = 2
  end

  # Master Nodes
  (1..MASTER_NODES).each do |i|
    config.vm.define "master-#{i}" do |master|
      master.vm.hostname = "k3s-master-#{i}"
      master.vm.network "private_network", ip: "192.168.56.#{10 + i}"
      
      master.vm.provision "shell", inline: <<-SHELL
        # Install k3s on master
        curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=stable sh -s - server \
          --cluster-init \
          --disable traefik \
          --disable servicelb \
          --write-kubeconfig-mode 644

        # Save the token for worker nodes
        cp /var/lib/rancher/k3s/server/node-token /vagrant/node-token
        cp /etc/rancher/k3s/k3s.yaml /vagrant/kubeconfig

	# Install ohmybash
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
      SHELL
    end
  end

  # Worker Nodes
  (1..WORKER_NODES).each do |i|
    config.vm.define "worker-#{i}" do |worker|
      worker.vm.hostname = "k3s-worker-#{i}"
      worker.vm.network "private_network", ip: "192.168.56.#{20 + i}"
      
      worker.vm.provision "shell", inline: <<-SHELL
        # Install k3s on worker
        curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=stable sh -s - agent \
          --server https://192.168.56.11:6443 \
          --token-file /vagrant/node-token
      SHELL
    end
  end
end

