pkg_name=gpgme
pkg_origin=core
pkg_version=1.15.1
pkg_license=('LGPL-2.1-or-later')
pkg_description="GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications."
pkg_upstream_url="https://www.gnupg.org/software/gpgme/index.html"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source=https://www.gnupg.org/ftp/gcrypt/${pkg_name}/${pkg_name}-${pkg_version}.tar.bz2
pkg_shasum=eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_build_deps=(core/gcc core/coreutils core/make)
pkg_deps=(core/glibc core/libassuan core/libgpg-error)

do_build() {
  ./configure \
    --prefix="$pkg_prefix" \
    --with-libgpg-error-prefix="$(pkg_path_for libgpg-error)" \
    --with-libassuan-prefix="$(pkg_path_for libassuan)"
  make
}
