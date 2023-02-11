/etc/apt/sources.list.d/pbs-enterprise.list:
  file.absent: []

{{ tpldot }}.repo:
  pkgrepo.managed:
    - humanname: Proxmox BS Repository
    - name: deb http://download.proxmox.com/debian/pbs {{ salt['grains.get']('oscodename') }} pbs-no-subscription
    - dist: {{salt['grains.get']('oscodename')}}
    - file: /etc/apt/sources.list.d/proxmox-pbs.list
    - key_url: https://enterprise.proxmox.com/debian/proxmox-release-{{ salt['grains.get']('oscodename') }}.gpg
    - clean_file: true
    - refresh: true

{{ tpldot }}.packages.installed:
  pkg.installed:
    - pkgs:
      - proxmox-backup
      - proxmox-backup-server
      - gdisk
      - xfsprogs
    - require:
      - pkgrepo: {{ tpldot }}.repo
