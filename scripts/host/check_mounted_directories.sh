#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")/../.." && vagrant_dir=$PWD

source "${vagrant_dir}/scripts/output_functions.sh"

cd "${vagrant_dir}"
if [[ ! -f "${vagrant_dir}/etc/guest/mysql/my.cnf" ]]; then
    error "Directory '${vagrant_dir}/etc' was not mounted as expected by Vagrant.
        Please make sure that 'paliarush/magento2.ubuntu' Vagrant box was downloaded successfully (if not, this may help http://stackoverflow.com/questions/35519389/vagrant-cannot-find-box)
        And that Vagrant is able to mount VirtualBox shared folders on your environment (see https://www.vagrantup.com/docs/synced-folders/basic_usage.html )"
    exit 1
fi
vagrant ssh -c "bash /vagrant/scripts/guest/check_mounted_directories" 2> >(logError)
