# cloudflare-domains-iac

Cloudflare で管理しているドメインを Terraform を使って IaC にするためのプロジェクト。

プルリクエスト作成後の plan や，マージ後の apply は自動的に Terraform Cloud で実行される。

## 管理しているドメイン

このプロジェクトでは以下のドメインを管理している。

- hiroxto.net

## セットアップ

### Terraform Cloud にログイン

Backend に Terraform Cloud を使っているため，Terraform Cloud へのログインを行う。

```bash
terraform login
```

### ローカルで実行したい場合: secrets.auto.tfvars を設定

plan の実行に Terraform Cloud を使わず一時的にローカルで実行したい場合は， secrets.auto.tfvars.example を secrets.auto.tfvars へコピーし，各種変数を設定する。

> [!NOTE]
> 開発中でも plan は Terraform Cloud で実行されるため，基本的にこの設定は不要。

```bash
cp secrets.auto.tfvars.example secrets.auto.tfvars
```
