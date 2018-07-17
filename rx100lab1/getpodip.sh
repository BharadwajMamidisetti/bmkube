curl -s --unix-socket /var/run/docker.sock http:/networks/bridge | jq -r '.IPAM.Config[].Subnet'
