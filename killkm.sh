echo "trying to kill all kubernetes components"

sudo kill -SIGINT $(pidof kube-apiserver etcd kube-controller-manager kube-scheduler)


