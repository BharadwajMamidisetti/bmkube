### Start Kubelet on nodeb
echo "Preparing to start kubelet "
echo "Removing old cache files at /var/lib/kubelet "
sudo rm -rf /var/lib/kubelet
sudo ~/kube-bin/kubelet --kubeconfig=scripts/nodeb.kubeconfig  --fail-swap-on=false > kubelet.log 2>&1 &

sleep 3
echo "Writing log into kubelet.log"
tail kubelet.log
### kube-proxy on nodeb
echo "Starting kube-proxy on nodea.."
sudo ~/kube-bin/kube-proxy --master nodea:8080 --config=scripts/kube-proxy-config > kube-proxy.log 2>&1 &
sleep 3
echo "Writing log into kube-proxy.log file"
sleep 4
tail kube-proxy.log

### Kubectl - reset 
sudo kubectl config use-context localb
sudo kubectl get nodes

echo " DONE."
~                                                    
