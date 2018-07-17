# Get pod ip address from kubectl command
kubectl get pod -o=custom-columns=Name:.metadata.name,hostIP:.status.hostIP,podIP:status.podIP
# Get pod id from docker API and jq.
curl -s --unix-socket /var/run/docker.sock http:/networks/bridge | jq -r '.IPAM.Config[].Subnet'

# Get POD ip address from docker0 bridge, via docker network sub command
docker network inspect bridge | jq -r '.[] | select(.Name=="bridge").IPAM.Config[].Subnet
