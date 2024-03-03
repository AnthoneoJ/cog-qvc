#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$@" > /dev/null 2>&1
}

# Check if Docker is already installed
if command_exists docker; then
  echo "Docker is already installed. Checking the version..."
  sudo docker --version
else
  echo "Docker is not installed. Proceeding with the installation..."

  echo 'Step 1: Update Software Repositories'
  sudo apt update

  echo 'Step 2: Install Dependencies'
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

  echo 'Step 3: Add Docker’s GPG Key'
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  echo 'Step 4: Add Docker Repository'
  sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  echo 'Step 5: Update Package Database'
  sudo apt update

  echo 'Step 6: Install Docker CE'
  sudo apt install -y docker-ce

  echo 'Step 7: Start and Enable Docker'
  sudo systemctl start docker
  sudo systemctl enable docker

  echo "Docker has been installed successfully."
  sudo docker --version
fi
