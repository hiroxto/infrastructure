#!/bin/sh
set -eu

# hook の入力を読み切り、検査結果は stderr、Codex への通知は stdout に出力する。
cat > /dev/null
cd "$(dirname "$0")/../.."

for task in fmt validate; do
    if mise run "$task" < /dev/null >&2; then
        :
    else
        # 非ゼロの終了コードだけでは Codex が継続するため、JSON で停止を要求する。
        printf '{"continue":false,"stopReason":"mise run %s が失敗したため停止しました。stderr の実行結果を確認してください。"}\n' "$task"
        exit 0
    fi
done

printf '%s\n' '{"systemMessage":"検査成功: mise run fmt / mise run validate"}'
