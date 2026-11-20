# csetコマンド
![test](https://github.com/Ak1fuj1/robosys2026/actions/workflows/test.yml/badge.svg)

makefileを含むc言語のセットアップを作る

## インストール方法
```
$ git clone https://github.com/Ak1fuj1/robosys2026
```

## 使い方
- 実行方法
```
$ ./cset (ファイル名)
```
  - 引数を与えてヘッダファイルを追加することも出来る
```
$ ./cset (ファイル名) -lm -lpthread
```

- ヘッダの追加
  - [cset_option.txt](cset_option.txt)から引数と対応するヘッダファイルを記入することで追加することができます。

### 対応済みヘッダ
- math.h
- pthread.h

### 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.10~3.14

### テスト環境
- ubuntu 24.04.1 LTS

### ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Akito Sudo- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。