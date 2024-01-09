FROM quay.io/fedora/fedora-coreos:stable
COPY etc /etc/
RUN wget https://copr.fedorainfracloud.org/coprs/ganto/lxc4/repo/fedora-"${FEDORA_MAJOR_VERSION}"/ganto-lxc4-fedora-39.repo -O /etc/yum.repos.d/ganto-lxc4-fedora-39.repo
RUN rpm-ostree install tailscale libvirt qemu qemu-user-static qemu-user-binfmt cockpit-bridge cockpit-system cockpit-networkmanager cockpit-selinux cockpit-storaged \ 
    cockpit-podman cockpit-machines cockpit-pcp htop lxc-libs squashfs-tools incus incus-agent
RUN systemctl enable tailscaled cockpit-server.service
RUN rm -rf /tmp/* /var/*
RUN ostree container commit
