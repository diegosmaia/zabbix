# /bin/bash
sudo swapoff -a
sudo sysctl vm.swappiness=10
sudo sysctl vm.drop_caches=3
sudo swapon -a

