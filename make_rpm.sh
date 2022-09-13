#!/bin/sh

mkdir work
cd work
dnf download --source nginx
rpm -ivh --define="%_topdir `pwd`/rpmbuild" nginx-*.src.rpm
wget -O rpmbuild/SOURCES/ngx_mruby-2.2.5.tar.gz https://github.com/matsumotory/ngx_mruby/archive/refs/tags/v2.2.5.tar.gz
wget -O rpmbuild/SOURCES/ngx_devel_kit-0.3.1.tar.gz https://github.com/vision5/ngx_devel_kit/archive/refs/tags/v0.3.1.tar.gz
patch -p1 -d rpmbuild/SPECS < ../nginx.spec.patch
rpmbuild  --define="%_topdir `pwd`/rpmbuild" -ba rpmbuild/SPECS/nginx.spec
cp rpmbuild/RPMS/x86_64/nginx-mod-http-mruby-1.*.rpm .
echo 'done!'
