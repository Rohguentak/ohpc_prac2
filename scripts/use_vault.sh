#!/bin/bash
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
yum-config-manager --disable base extras updates epel
yum-config-manager \
  --add-repo http://vault.centos.org/${1}/os/x86_64/ \
  --add-repo http://vault.centos.org/${1}/extras/x86_64/ \
  --add-repo http://vault.centos.org/${1}/updates/x86_64/ || true

#yum-config-manager --enable C7.6.1810-base C7.6.1810-extras C7.6.1810-update

cat > /etc/yum.repos.d/epel-7.9.repo << __EOF
[epel-7.9]
baseurl=https://archives.fedoraproject.org/pub/archive/epel/7.2019-05-29/x86_64/
name=epel-7.9
enabled=1
gpgcheck=0
__EOF

#yum-config-manager --enable epel-7.9

cat > /etc/yum.repos.d/CentOS-Vault.repo << __EOF
[C7.6.1810-base]
name=CentOS-7.6.1810 - Base
baseurl=http://vault.centos.org/7.6.1810/os/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0

[C7.6.1810-updates]
name=CentOS-7.5.1804 - Updates
baseurl=http://vault.centos.org/7.6.1810/updates/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0

[C7.6.1810-extras]
name=CentOS-7.6.1810 - Extras
baseurl=http://vault.centos.org/7.6.1810/extras/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0

[C7.6.1810-centosplus]
name=CentOS-7.6.1810 - CentOSPlus
baseurl=http://vault.centos.org/7.6.1810/centosplus/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0

[C7.6.1810-fasttrack]
name=CentOS-7.6.1810 - Fasttrack
baseurl=http://vault.centos.org/7.6.1810fasttrack/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0
__EOF

