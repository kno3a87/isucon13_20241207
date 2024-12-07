#! /bin/bash

set -eu

TARGETS=(
	# link_etc.sh と同じ内容
        /etc/mysql/mysql.conf.d/mysqld.cnf
	/etc/nginx/nginx.conf
	/etc/nginx/sites-available/isupipe.conf
)

for target in ${TARGETS[@]}
do
  if [[ ! -e $target.backup ]]; then
    sudo mv $target $target.backup
    sudo ln -s $HOME/$target $target
  fi
done

