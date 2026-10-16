#!/bin/sh
set -eu

# hook の入力を読み切り、Stop による継続の繰り返しを防ぐ。
hook_input=$(cat)
if [ "${1-}" != "PostToolUse" ] && printf '%s\n' "$hook_input" | jq -e '.stop_hook_active == true' > /dev/null; then
    printf '%s\n' '{}'
    exit 0
fi

# 検査結果は stderr、成功通知は stdout に出力する。
cd "$(dirname "$0")/../.."

for task in fmt validate; do
    if mise run "$task" -- -no-color < /dev/null >&2; then
        :
    else
        # 終了コード 2 で stderr を Codex に渡し、修正の継続を促す。
        printf 'mise run %s が失敗しました。上記のエラーを修正して再実行してください。\n' "$task" >&2
        exit 2
    fi
done

if [ "${1-}" = "PostToolUse" ]; then
    printf '%s\n' '{"systemMessage":"検査成功: mise run fmt / mise run validate","hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"mise run fmt と mise run validate が成功しました。"}}'
else
    printf '%s\n' '{"systemMessage":"検査成功: mise run fmt / mise run validate"}'
fi
