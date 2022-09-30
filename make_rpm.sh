#!/bin/sh

NGX_MRUBY_VERSION=2.2.5

mkdir work
cd work
dnf download --source nginx
rpm -ivh --define="%_topdir `pwd`/rpmbuild" nginx-*.src.rpm
curl -L -o rpmbuild/SOURCES/ngx_mruby-${NGX_MRUBY_VERSION}.tar.gz https://github.com/matsumotory/ngx_mruby/archive/refs/tags/v${NGX_MRUBY_VERSION}.tar.gz
patch -p1 -d rpmbuild/SPECS < ../nginx.spec.patch
rpmbuild  --define="%_topdir `pwd`/rpmbuild" -ba rpmbuild/SPECS/nginx.spec
cp rpmbuild/RPMS/x86_64/nginx-mod-http-mruby-1.*.rpm .
echo 'done!'
