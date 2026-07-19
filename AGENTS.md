# Repository Guidelines

## 応答と進め方

- 応答は日本語で簡潔かつ丁寧に行う。
- 要件，対象リソース，環境，期待する差分が不明な場合は，推測で Terraform の変更を進めず，実装前に依頼者へ確認する。
- 明示的な指示がない限り，代替案やフォールバック手順は提示しない。
- 複雑な作業では，必要に応じて調査，設計，実装，レビュー，QA の観点を分けて検討し，作業漏れを防ぐ。

## プロジェクト構成

このプロジェクトでは Terraform で Cloudflare と New Relic の設定を管理します。
ルート直下にはプロバイダ，変数，出力，Cloudflare 関連のリソースを配置しています。
`observe/` 配下には New Relic のリソースを配置しています。
terraform plan と apply は Terraform Cloud で実行されます。

## 関連リポジトリ

- [hiroxto/home-server-infrastructure](https://github.com/hiroxto/home-server-infrastructure): 自宅サーバーで稼働するサービスの Docker Compose 設定と，各サービスで使用する設定ファイルを管理します。
- [hiroxto/home-server-infrastructure-docker](https://github.com/hiroxto/home-server-infrastructure-docker): `home-server-infrastructure` で使用する Docker イメージの Dockerfile と，GitHub Container Registry へデプロイするための設定を管理します。

## 開発で使用する主要コマンド

- `mise run init`: 初期化する
- `mise run fmt`: コードを整形する
- `mise run validate`: 構文と設定を検証する
- `mise run plan`: plan を実行する。
- `mise run ci`: fmt, validate, planをまとめて実行する

## コード変更後の確認内容

Terraform のコード変更後は少なくとも `mise run fmt` と `mise run validate` を実行する。
リソース差分が発生する変更では `mise run plan` を実行し，想定通りの差分になっていることを確認する。
`mise run plan` の結果は Terraform Cloud で実行される前提で扱い，ローカル apply は行わない。

## コミットとプルリクエスト

- 1 つのコミットでは 1 つの意図に絞る
- コミットメッセージのプレフィックスには `feat:`，`fix:`，`delete:`，`docs:`，`ci:` のような短い Conventional Commits 形式を使用する。
- コミットメッセージは何を変更するかを日本語で簡潔に書く
- コミット前に差分を確認し，実際の変更内容に沿ったメッセージにする。
- PR 作成時は `.github/pull_request_template.md` の構成に従い，テンプレートの見出しを維持して本文を埋める。
- Terraform に影響しない変更ではその旨を記載し，Terraform 用の確認コマンドを実行済みとして書かない。
- 削除・再作成やシークレット更新の有無を差分や plan から確認できない場合は，なしと断定せず未確認または不明として記載する。
- 削除・再作成が起きるリソースやシークレット更新が必要な場合は明記する。
