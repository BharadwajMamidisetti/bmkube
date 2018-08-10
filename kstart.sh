### Clear Logs
cd ~
rm *.log

### Start etcd
echo "Removing /var/lib/etcd"
sudo rm -Rf /var/lib/etcd

echo "Removing default.etcd "
rm -Rf ~/default.etcd/
ls 

echo "Starting etcd server .."
echo "Writing log to etcd.log"
etcd > etcd.log 2>&1 &

sleep 5s
tail etcd.log
sleep 4s

### API Server

echo "Start API - Server ..."

sudo ~/k8s/_output/bin/kube-apiserver --etcd-servers=http://localhost:2379 --service-cluster-ip-range=10.3.0.0/16 --insecure-bind-address=0.0.0.0 > kube-apiserver.log 2>&1 &

sleep 5s
echo "Writing log into kube-apiserver.log "
sleep 2s
tail kube-apiserver.log

### Control Manager
echo "Starting Control manager component .."
~/k8s/_output/bin/kube-controller-manager --kubeconfig=scripts/nodea.kubeconfig > kube-controller-manager.log 2>&1 &

sleep 6
echo "Writing log into kube-controller-manager.log .."

tail kube-controller-manager.log
### Schedular

echo "Starting Schedular.."
~/k8s/_output/bin/kube-scheduler --master=http://nodea:8080 > kube-scheduler.log 2>&1 &

sleep 5

echo "Writing log into kube-schedular.log.."
tail kube-scheduler.log

echo "All k8 master node components are started.."

ps -aefo comm


