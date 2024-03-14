# work-terminal

## Set up your workstation for kubernetes

Disable swap

```
sudo systemctl disable dphys-swapfile.service
```
Enabled memory cgroup

```/boot/cmdline.txt
cgroup_enable=memory cgroup_memory=1
```
Enable NVMe boot order

# change last char in BOOT_ORDER=0xf461 to 6: BOOT_ORDER=0xf466
sudo rpi-eeprom-config --edit

