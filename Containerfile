FROM quay.io/fedora/fedora-coreos:stable
COPY etc /etc/
RUN rpm-ostree install tailscale libvirt qemu qemu-user-static qemu-user-binfmt cockpit-bridge cockpit-system cockpit-networkmanager cockpit-selinux cockpit-storaged \ 
    cockpit-podman cockpit-machines cockpit-pcp htop
RUN systemctl enable tailscaled cockpit-server.service
RUN rm -rf /tmp/* /var/*
RUN ostree container commit
