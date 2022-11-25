# devops-container-image

DevOps作業用のコンテナイメージ。よく使うCLIをインストール済み。
現状はRed Hat UBI 9イメージを使っているので、`microdnf`や`rpm`コマンドでパッケージ追加も可能です。

## ビルド方法

次のように実行

### Intel or AMD x86マシン

```
$ docker image build --compress -t devops-img:latest -f Dockerfile-amd64 .
```

### arm64 or aarch64マシン

```
$ docker image build --compress -t devops-img:latest -f Dockerfile-arm64 .
```

## 使い方

```
$ docker container run -it devops-img:latest bash
```
