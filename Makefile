cluster = m5-cluster
working_dir = $(shell pwd)
cmd = ansible-playbook -i /work/inventory/$(cluster).ini --become --become-password-file=/work/.tmppwd
k8s_version = v1.29.2
kubespray_version = master
create-cluster:
	docker run --user $(id -u):$(id -g) --network host --rm -it --mount type=bind,source="$(working_dir)",dst=/work \
    --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
    quay.io/kubespray/kubespray:$(kubespray_version) $(cmd) cluster.yml -e kube_version=$(k8s_version)

upgrade-cluster:
	docker run --user $(id -u):$(id -g) --network host --rm -it --mount type=bind,source="$(working_dir)",dst=/work \
    --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
    quay.io/kubespray/kubespray:$(kubespray_version) $(cmd) cluster.yml -e upgrade_cluster_setup=true -e kube_version=$(k8s_version)

reset-cluster:
	docker run --user $(id -u):$(id -g) --network host --rm -it --mount type=bind,source="$(working_dir)",dst=/work \
    --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
    quay.io/kubespray/kubespray:$(kubespray_version) $(cmd) reset.yml
