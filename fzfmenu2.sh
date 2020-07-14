#!/usr/bin/env sh

exists() {
	while IFS= read -r f; do
		test -e "$f" && echo "$f"
	done
}

prog=$(ls -1 $(echo $PATH | tr ':' '\n' | exists) |
	awk 'NF' |
	grep -v ':' |
	sort -u |
	awk '{print $1}' |
	/home/al/Programs/fzfmenu/./fzfmenu.sh)

[ -z $prog ] && exit 1

exec $prog
