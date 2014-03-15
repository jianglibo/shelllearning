#!/bin/bash


#cpan App::perlbrew
#perlbrew init

output=$(curl -L http://install.perlbrew.pl | bash)

wait $!

zai=$(cat ~/.bash_profile | sed -n /perlbrew/p)

if [[ -z $zai ]]; then
    echo 'source ~/perl5/perlbrew/etc/bashrc' >>~/.bash_profile
fi

exec perlbrew install 5.16.3
wait $!

exec perlbrew switch perl-5.16.3

#perlbrew install-cpanm
#cpanm Moose

#perlbrew available
#perlbrew install 5.16.3
#perlbrew list
#perlbrew switch perl-5.16.3
#perlbrew off

#perl-5.16.3.tar.gz