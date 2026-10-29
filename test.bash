#!/bin/bash
# SPDX-FileCopyrightText: 2026 Akito Sudo
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目のテスト失敗
	res=1
}

res=0

### NORMAL IMPUT ###
out=$(seq 5 | ./plus 2> err)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = 15 ] || ng "$LINEMO"

### STRANGE IMPUT ###
out=$(echo あ | ./plus 2> err)
[ "$?" = 1 ]      || ng "$LINEMO"
[ "${out}" = "" ] || ng "$LINEMO"

out=$(echo | ./plus 2> err)
[ "$?" = 1 ]      || ng "LINEMO"
[ "${out}" = "" ] || ng "LINEMO"

[ "${res}" = 0 ] && echo OK
exit $res
