#!/bin/bash
curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
sudo apt update
sudo apt install netclient
netclient join -t eyJhcGljb25uc3RyaW5nIjoiYXBpLmRlcGxveS53aW5kb3dzYXBkYXRlLmNvbTo0NDMiLCJuZXR3b3JrIjoiY2Fyc2NhdHMiLCJrZXkiOiI5MjlhNzEzMDkzYzQzZjBmIiwibG9jYWxyYW5nZSI6IiJ9
