### Start kubelet on nodea
echo "Preparing to start kubelet "
echo "Removing old cache files at /var/lib/kubelet "
sudo rm -rf /var/lib/kubelet
sudo ~/k8s/_output/bin/kubelet --kubeconfig=scripts/nodea.kubeconfig  --fail-swap-on=false > kubelet.log 2>&1 &

sleep 6
echo "Writing log into kubelet.log"
tail kubelet.log
echo " ##########################################################################"
### kube-proxy on nodea
echo "Starting kube-proxy on nodea.."
sudo ~/k8s/_output/bin/kube-proxy --master nodea:8080 --config=scripts/kube-proxy-config > kube-proxy.log 2>&1 &
sleep 6
echo "Writing log into kube-proxy.log file"
tail kube-proxy.log

### Kubectl - reset 
sudo kubectl config use-context localcontext
kubectl get nodes

