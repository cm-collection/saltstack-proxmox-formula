{{ tpldot }}.repo:
  pkgrepo.managed:
    - humanname: Proxmox VE Repository
    - name: deb http://download.proxmox.com/debian/pve {{ salt['grains.get']('oscodename') }} pve-no-subscription
    - dist: {{salt['grains.get']('oscodename')}}
    - file: /etc/apt/sources.list.d/proxmox-pve.list
    - key_url: https://enterprise.proxmox.com/debian/proxmox-release-{{ salt['grains.get']('oscodename') }}.gpg
    - clean_file: true
    - refresh: true

{{ tpldot }}.packages.installed:
  pkg.installed:
    - pkgs:
      - libpve-network-perl
      - ifupdown2
    - require:
      - pkgrepo: {{ tpldot }}.repo
