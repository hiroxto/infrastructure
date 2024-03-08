# cloudflare-domains-iac

Cloudflare で管理しているドメインを Terraform を使って IaC にするためのプロジェクト。

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
