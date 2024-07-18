#!/usr/bin/env bash

# Usage: ova2qcow2 <file.ova>
#
# Required dependencies:
# - qemu (brew install qemu)

set -x

if [[ $# -ne 1 ]]; then
	echo "Usage: ova2qcow2.sh <file.ova>"
	exit 1
fi

ova="$1"

basedir=$(dirname "$ova")

tmpdir=$(mktemp -d -t ova2qcow2.XXXXXXXX)
tar xvzf "$ova" -C "$tmpdir"

for i in ${tmpdir}/*.vmdk; do
	name=$(basename -s .vmdk "$i")
	qemu-img convert -O qcow2 "$i" "${basedir}/${name}.qcow2"
done

rm -r "$tmpdir"
