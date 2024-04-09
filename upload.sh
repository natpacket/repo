#!/bin/bash
ssh root@120.55.82.61 "rm /root/repo/Packages.zst"
ssh root@120.55.82.61 "rm /root/repo/Packages"
ssh root@120.55.82.61 "rm /root/repo/Packages.bz2"
ssh root@120.55.82.61 "rm /root/repo/Packages.gz"
ssh root@120.55.82.61 "rm /root/repo/Packages.lz4"
ssh root@120.55.82.61 "rm /root/repo/Packages.lzma"
ssh root@120.55.82.61 "rm /root/repo/Packages.xz"
scp Packages.zst Packages Packages.bz2 Packages.gz Packages.lz4 Packages.lzma Packages.xz root@120.55.82.61:/root/repo/
