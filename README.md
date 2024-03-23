# Raspberry Pi 5 Kubernetes Cluster

## Front
![front](misc/front.jpg)

## Back

![back](misc/back.jpg)

## Bill of Materials 

### Hardware

- 3 x Raspberry Pi 5
- 3 x Raspberry Pi 5 Original Power Supply
- 3 X Raspberry Pi Active Cooler
- 2 x GeeekPi N04 M.2 M-Key NVMe SSD Shield for Raspberry Pi 5
- 2 x WD_BLACK SN770 NVMe SSD
- 3 x Amazon Basics MicroSD Card

### Network

- 1 x Ubiquiti UniFi Switch Flex Mini
- 3 x Flat Patch Cable 0.25m

### Case

- Joy-it RB-Case+19 SBC-Acrylic-Case 
- Hex Spacers M3*35

### Misc

- ORICO M.2 NVMe SSD Enclosure
- shinfly 2 x 1.5 m Cable Sleeve

## Manual Pre-Installation steps

### Disable swap permanently

```
sudo systemctl disable dphys-swapfile.service
```

### Enabled memory cgroup

```bash
# add to /boot/firmware/cmdline.txt
cgroup_enable=memory cgroup_memory=1
```

### Change boot order to boot from NVMe SSD

```bash
# Change last char in BOOT_ORDER=0xf461 to 6: BOOT_ORDER=0xf466
sudo rpi-eeprom-config --edit
```

## Manage K8s with [Kubespray](https://github.com/kubernetes-sigs/kubespray)

### Install K8s

```bash
make -B create-cluster
```
### Upgrade K8s

```bash
make -B upgrade-cluster k8s_version=v1.29.2
```

### Remove K8s

```bash
make -B reset-cluster
```
