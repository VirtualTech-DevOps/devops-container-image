# devops-container-image

DevOps作業用のコンテナイメージ。よく使うCLIをインストール済み。
現状はRed Hat UBI 9イメージを使っているので、`microdnf`や`rpm`コマンドでパッケージ追加も可能です。

## ビルド方法

次のように実行

### Intel or AMD x86マシン

```bash
docker image build --compress -t devops-img:latest -f amd64/Dockerfile .
```

### arm64 or aarch64マシン

```bash
docker image build --compress -t devops-img:latest -f arm64/Dockerfile .
```

## 使い方

```bash
docker container run -it devops-img:latest bash
```
