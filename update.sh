#!/bin/bash

git pull

dpkg-scanpackages -m ./debs > ./Packages && bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
xz -5fkev --format=lzma Packages > Packages.lzma
lz4 -c9 Packages > Packages.lz4
gzip -c9 Packages > Packages.gz
zstd -c19 Packages > Packages.zst

#
#解释：
# /^\?\?/: 匹配未跟踪的文件。
# $2 !~ /\.txt$/: 筛选 不以 .txt 结尾 的文件。
# $2 ~ /\.txt$/:  筛选 以 .txt 结尾 的文件。
# {print $2}: 输出文件路径。
# xargs -I {}: 将过滤后的文件路径逐个传递给 scp 命令。

#先scp没有add的debs 
git status --porcelain | awk '/^\?\?|^ M/ && $2 ~ /\.deb$/ {print $2}' | xargs -I {} echo scp {} root@120.55.82.61:/root/repo/debs
git status --porcelain | awk '/^\?\?|^ M/ && $2 ~ /\.deb$/ {print $2}' | xargs -I {} scp {} root@120.55.82.61:/root/repo/debs
# git status --porcelain | awk '/^\?\?/ {print $2}' | xargs -I {} scp {} root@120.55.82.61:/root/repo/debs
#再scp repo的源信息
git status --porcelain | awk '/^\?\?|^ M/ && $2 !~ /\.deb$/ {print $2}' | xargs -I {} echo scp {} root@120.55.82.61:/root/repo/debs
git status --porcelain | awk '/^\?\?|^ M/ && $2 !~ /\.deb$/ {print $2}' | xargs -I {} scp {} root@120.55.82.61:/root/repo/
# git status --porcelain | awk '/^ M/ {print $2}' | xargs -I {} scp {} root@120.55.82.61:/root/repo/

git add . && git commit -m "提交更新" && git push
echo "生成成功！"
