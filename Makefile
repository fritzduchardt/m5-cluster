cluster = m5-cluster
kubespray_version = v2.23.1
working_dir = $(shell pwd)
cmd = ansible-playbook -i /work/inventory/$(cluster).ini --become --become-password-file=/work/.tmppwd
create-cluster:
	docker run --user $(id -u):$(id -g) --network host --rm -it --mount type=bind,source="$(working_dir)",dst=/work \
    --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
    quay.io/kubespray/kubespray:$(kubespray_version) $(cmd) cluster.yml
reset-cluster:
	docker run --user $(id -u):$(id -g) --network host --rm -it --mount type=bind,source="$(working_dir)",dst=/work \
    --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
    quay.io/kubespray/kubespray:$(kubespray_version) $(cmd) reset.yml
