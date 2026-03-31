# Repository Guidelines

## プロジェクト構成

このプロジェクトでは Terraform で Cloudflare と New Relic の設定を管理します。
ルート直下にはプロバイダ，変数，出力，Cloudflare 関連のリソースを配置しています。
`observe/` 配下には New Relic のリソースを配置しています。
terraform plan と apply は Terraform Cloud で実行されます。

## 開発で使用する主要コマンド

- `mise run init`: 初期化する
- `mise run fmt`: コードを整形する
- `mise run validate`: 構文と設定を検証する
- `mise run plan`: plan を実行する。
- `mise run ci`: fmt, validate, planをまとめて実行する

## コード変更後の確認内容

Terraform のコード変更後は少なくとも `mise run fmt` と `mise run validate` を実行する。
リソース差分が発生する変更では `mise run plan` を実行し，想定通りの差分になっていることを確認する。

## コミットとプルリクエスト

- 1 つのコミットでは 1 つの意図に絞る
- コミットメッセージのプレフィックスには `feat:`，`fix:`，`delete:`，`docs:`，`ci:` のような短い Conventional Commits 形式を使用する。
- コミットメッセージは何を変更するかを日本語で簡潔に書く
- PR では変更内容，変更理由，Terraform への影響を簡潔に記載し，関連 Issue があればリンクする。
- 削除・再作成が起きるリソースやシークレット更新が必要な場合は明記する。
