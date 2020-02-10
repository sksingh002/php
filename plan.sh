pkg_name=php
pkg_origin=sksingh002
pkg_version="5.4.7"  #httpd-2.2.3.tar.gz
pkg_maintainer="Saurabh Kr Singh <sksingh002@gmail.com>"
pkg_license=("Apache-2.0")
pkg_source="http://museum.php.net/php5/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="5570076b4f5e3a01536def80cbaa20d0e5be7fc0cce13d698a9d1abf89488476"

pkg_deps=(
  core/coreutils
  core/curl
  core/glibc
  core/libxml2
  core/openssl
  core/readline
  core/zlib
  core/flex
  sksingh002/httpd
)
pkg_build_deps=(
  core/bison2
  core/gcc
  core/make
  core/re2c
)
pkg_bin_dirs=(bin sbin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_interpreters=(bin/php)

do_build() {
  ./configure --prefix="$pkg_prefix" \
    --enable-exif \
    --enable-fpm \
    --enable-mbstring \
    --enable-opcache \
    --with-readline="$(pkg_path_for readline)" \
    --with-curl="$(pkg_path_for curl)" \
    --with-libxml-dir="$(pkg_path_for libxml2)" \
    --with-openssl="$(pkg_path_for openssl)" \
    --with-xmlrpc \
    --with-zlib="$(pkg_path_for zlib)"
  make
}
do_install() {
  do_default_install
}

#do_check() {
#  make test
#}