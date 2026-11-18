#!/bin/bash
# SPDX-FileCopyrightText: 2026 Akito Sudo
# SPDX-License-Identifier: BSD-3-Clause

set -Eeuo pipefail
#-e コマンドが失敗した場合にスクリプトを終了する
#-u 未定義の変数を使用した場合にスクリプトを終了する
#-o bashのオプションを指定する
#pipefail パイプライン内のコマンドが失敗した場合にスクリプトを終了する

# csetの場所
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
#dirname "$0" 実行した際のスクリプトのディレクトリ
#$0 実行した際のスクリプトのパス
#cdしてからpwdで絶対パスを取得してSCRIPT_DIRに格納する

# テスト用の一時ディレクトリ
TEST_DIR=$(mktemp -d)
#mktemp 一時的なファイルやディレクトリを作成するコマンド
#-d ディレクトリを作成するオプション
#作成した一時ディレクトリのパスをTEST_DIRに格納する

# 終了時に削除
trap 'rm -rf "$TEST_DIR"' EXIT
#trap コマンドは、指定したシグナルを受け取ったときに実行するコマンドを設定するためのコマンド
#EXIT シグナルは、スクリプトが終了する際に送信されるシグナル

cd "$TEST_DIR"

# 1. プロジェクト生成
python3 "$SCRIPT_DIR/cset" sample

# 2. ファイル生成確認
test -d sample
test -f sample/sample.c
test -f sample/makefile
#test 条件を満たすかどうかを確認する
# -d  ディレクトリが存在するかどうかを確認する
# -f  ファイルが存在するかどうかを確認する

# 3. 内容確認
grep -q "int main(void)" sample/sample.c
grep -q "TARGET = sample" sample/makefile
#grep ファイル内から特定の文字を探す
#-q quiet

# 4. コンパイルと実行
cd sample
make
./sample

# 5. clean確認
make clean
test ! -f sample
#! -f  ファイルが存在しないかどうかを確認する

cd ..

echo "All tests passed!"