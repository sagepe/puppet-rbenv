# == Class: rbenv::deps::debian
#
# This module manages rbenv dependencies for Debian $::osfamily.
#
class rbenv::deps::debian {

  case $facts['os']['distro']['codename'] {
    'stretch': {
      $libreadline_dev_package = 'libreadline-dev'
      $libssl_dev_package      = 'libssl1.0-dev'
    }
    default: {
      $libreadline_dev_package = 'libreadline6-dev'
      $libssl_dev_package      = 'libssl-dev'
    }
  }

  ensure_packages([
    'build-essential',
    'git',
    $libreadline_dev_package,
    $libssl_dev_package,
    'zlib1g-dev',
    'libffi-dev',
    'libyaml-dev',
    'libncurses5-dev',
    'libgdbm3',
    'libgdbm-dev',
    'patch'
    ])
}
