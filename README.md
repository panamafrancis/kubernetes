# Setup Instructions
- Clone the repo to a local directory.
- Make sure you have Vagrant installed.
- cd into the repo and do "vagrant up", this will create five virtual machines.
- Do "vagrant status" to get a list of the new VMs.
- Do "vagrant ssh launcher" and sudo -i to root.
- run the script "~/kubernetes/deploy-ha-cluster.sh" to install Kubernetes cluster.

