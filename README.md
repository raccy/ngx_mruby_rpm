# ngx_mruby_rpm
ngx_mrubyのRPMを作るための環境とかスクリプトとか

## 必要なパッケージ

- gcc
- make
- rpm-build
- gd-devel
- libxslt-devel
- pcre-devel
- perl-ExtUtils-Embed
- perl-devel
- perl-generators
- rubygem-rake
- bison

## RPMの作成方法

```
./make_rpm.sh
```

work直下にnginx-mod-http-mrubyのRPMが作成されます。

## RPMのインストール方法

nginx等をインストールしてから

```
rpm -ivh RPMファイル
```

としてください。同じバージョンのngixnでしか動作しませんので、ご注意ください。
