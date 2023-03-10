FROM quay.io/fedora/fedora-coreos:stable
COPY etc/* /etc/
RUN rpm-ostree install tailscale libvirt qemu qemu-user-static qemu-user-binfmt
RUN systemctl enable tailscaled
RUN ostree container commit