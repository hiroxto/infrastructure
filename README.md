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

### secrets.auto.tfvars を設定

secrets.auto.tfvars.example を secrets.auto.tfvars へコピーし編集する。

```bash
cp secrets.auto.tfvars.example secrets.auto.tfvars
```
