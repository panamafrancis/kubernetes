#!/bin/bash

#Setting hosts file"
cat >> /etc/hosts << EOM
192.168.56.101  master1
192.168.56.102  master2
192.168.56.103  node1
192.168.56.104  node2
192.168.56.105  launcher
EOM


#Setting ssh keys"
mkdir /root/.ssh

cat >> /root/.ssh/authorized_keys << EOM
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJNIlGpQ0KZekQ8YNsfDTaZ63/tXWZM29f7vof73IKHjm4mWlFmC1V25ypv9h8BRRW++3WXDEw4T2p20TnRRFZ/OzjYGn1HVMenyyjluTM6R4RYF7umiXjyggiYlABIOWyhvoc3Tonq0E3l3hNOKCGSpDx3YH2RTIDdDrQDdlER2DEic6UCWtNeAtH/luT/PaNhIYbZSG6ZGzhi0GK1kJeme5MRf8XLEta0hIBAkK6EzWhQfs0ND6vUkSVHxNkk5z5w16GjZKszJwUkWDO+C++rPKdw00lAL9RaJz693CPGEqu1qPy2KuLY1N2QzbedR7coCVHcLBkTYiAFBDhdkp1 root@config
EOM

chmod 600 /root/.ssh/*

cat >> /root/.ssh/id_rsa << EOM
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAyTSJRqUNCmXpEPGDbHw02met/7V1mTNvX+76H+9yCh45uJlp
RZgtVducqb/YfAUUVvvt1lwxMOE9qdtE50URWfzs42Bp9R1THp8so5bkzOkeEWBe
7pol48oIImJQASDlsob6HN06J6tBN5d4TTighkqQ8d2B9kUyA3Q60A3ZREdgxInO
lAlrTXgLR/5bk/z2jYSGG2UhumRs4YtBitZCXpnuTEX/FyxLWtISAQJCuhM1oUH7
NDQ+r1JElR8TZJOc+cNeho2SrMycFJFgzvgvvqzyncNNJQC/UWic+vdwjxhKrtaj
8tiri2NTdkM23nUe3KAlR3CwZE2IgBQQ4XZKdQIDAQABAoIBAF+OkOe5OYFHtzHx
0b3zG1LizLNV5dz1nZ6NK8OA/8MoabdvPJzt0hIls7i2wUTdULSi/2i/7ijNwHBs
D8RafAwl4Ad44bmkzLYNWLD02AMtb7dG8q8VDIurhsN1t5NhoVVxX1XYB2eRoO6b
BGqAS1ScE0ybK77fTApx6ACpoxcWi50x2rkvGjYK8+Gu8XtbjrukC2lJ5GulnvKh
WAeuMGdwrvUP/mpYmZqCp8686RpQ9LHEWPo9tMeWRxHx1m8lXjiLs/K6TJGUncOD
pPynCL4IPG5i5YVCX2f+PqvOzCiNn71u3ZEHhb1/fbCmZfUH2cWuzbByFK0i8FhZ
i0mf2CECgYEA5HRBN3rr4s6qya5io+Ootw8fIi3nM9up7UmLWwzQ34KPtA/G3WX9
RPp9xRVnaqJU7ar8KV/SkiilLSQNoUuqXNhTLwuAuKDY5ELh+FAmTZ7YxpqB0xh4
xCz0XUEHt9bSS4xT5gNcuji/86m/4XpIVQjbUENuEcOxWhaZXRTTKz0CgYEA4Xcu
+GgVhNWD+zKonOGg+jSe23c1BqwBVaclwQ+AUrNd+nZolU6GoPRCnUQhu9i5P1QA
2yCL9T1w7/5ECK/nzMbwtkAVeBB/thMHViKNgadogRHLcSX4v0U1YWxdEEuwqbXl
W8WtHwlgiYGVXaMprlXQ9fRPkASnF3692F2qb5kCgYAozyeTPI8EnfxeOJuAQTuz
L61VErQZTGUHcTrGkfyB4LXA6YyRohVjDAgJe7BUmRjot8GBto9L8pzG+ojAxl5x
ZWc+oSRmVr1H0TbCf7bH6Nc6awFD7zwrdwhT3Dj/uw0n17JpBTK8RUTsxuby5UAk
iId8x/7Sh42X1S+iNAUg1QKBgAN1HW5HwlS4JX77puRI/Xv4xJre+BwzFQ4oMwcD
4tbh00Yc/LuVabEcLc1VlyLXTvfupNi3Zg4LtCiqAIcVk3trbZON5gZiUmMLZahn
fT4IwCyChlkk2Oyt9gSZcc/nKT1hAbRnkqEQNr/FEfJOpzv6KusqpPGzcJCGrAie
Xxe5AoGBAN9mYgWsGrRe1lR/c5/NASoUQTGuskGv/iay8ah6D7l6p8Q+gTdr1C+f
Js/RDWtf2w/KIoqmqxiORoXms4ayzoDTm+6LqT5+qiuSjcac7Kjc1WVrAug0TpB7
TCgrIcHZE6ciN8cDHNCC+frGOWb0XZkhgmB2LDOookT1u26S/26U
-----END RSA PRIVATE KEY-----
EOM

chmod 600 /root/.ssh/id_rsa

#Install kubectl
curl -s -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

#Get k8s installer files
hostname=`hostname`
if [ $hostname == "launcher" ]
then
apt-get install -y git
cd /root
git clone https://github.com/panamafrancis/kubernetes.git
fi



