# 更新・復元と対応言語

## プラグインのバージョン管理

`lazy-lock.json`をGit管理し、確認済みのプラグインのコミットを記録します。新しい設定を反映しただけでは、実行中のNeovimに読み込まれたプラグインは切り替わらないため、更新・復元後は再起動してください。

### 普段の更新

1. `:Lazy update`でプラグインを更新する。
2. 再起動して、普段使う言語のLSP・補完・フォーマットを確認する。必要に応じて`:checkhealth`も確認する。
3. `git diff -- lazy-lock.json`で更新を確認し、動作確認したlockfileをコミット・pushする。

### 別マシンで同じ版を使う

1. 設定リポジトリを取得・更新する。
2. Neovimで`:Lazy restore`を実行する。
3. Neovimを再起動する。SKK辞書や外部コマンドは[機能表](KEYMAPS.md)を参照して別途用意する。

### 更新後に問題が出た場合

動作していたコミットのlockfileを取り出してから、`:Lazy restore`でその版へ戻せます。現在のlockfileを退避し、対象をlockfileだけに限定してください。

`COMMIT_ID`を動作していたコミットIDに置き換えます。

```sh
cd ~/.config/nvim
cp lazy-lock.json /tmp/lazy-lock.before-restore.json
# 取得・JSON検証に成功した場合だけlockfileを置き換える
if git show COMMIT_ID:lazy-lock.json > /tmp/lazy-lock.working.json &&
   python -m json.tool /tmp/lazy-lock.working.json > /dev/null; then
  cp /tmp/lazy-lock.working.json lazy-lock.json
fi
```

その後、Neovimで`:Lazy restore`を実行します。

## 対応言語

開発言語のExtraは以下の3つです。

- Python：`lang.python`（uv連携も維持）
- Go：`lang.go`
- Rust：`lang.rust`

Markdown・GitのExtraと、Linux設定ファイル向け`util.dot`は編集支援として維持します。LazyVim標準のLua設定支援もそのままです。

Java・Ruby・C/C++/CMake・TypeScript・Prisma・Tailwind・SQL・LaTeX・JSON・YAML・TOMLの言語Extra、およびESLint Extraは外しています。追加したい言語が出たときに`:LazyExtras`で追加します。以前Masonで導入した外部ツールは、この変更では削除しません。

## AI機能の役割

- Copilot：入力補完。
- CopilotChat：日本語プロンプトを使った対話。
- Sidekick：AI CLIとの接続・コンテキスト送信。NESは無効。
- OpenCode：既存の質問・アクション操作を維持。

Sidekickは公式`ai.sidekick` Extraを使い、ローカル設定には差分だけを記述します。通常補完やCopilotChatの認証は別途`:Copilot auth`で行います。

## タスク実行

Overseerは公式`editor.overseer` Extraで導入し、コマンドやキーを使うときに読み込みます。

- `Space oo`：タスク選択。
- `Space ow`：タスク一覧。
- `Space ot`：再実行・停止などの操作。
- `:Jaq`／`,r`：従来の単一ファイル実行。

## フォーマット

`Space fm`は`LazyVim.format({ force = true })`を使います。LSPを直接呼ばず、保存時と同じフォーマッター選択を通します。手動操作なので自動フォーマットが無効でも実行します。

## 公式資料

- [lazy.nvim lockfile](https://lazy.folke.io/usage/lockfile)
- [LazyVimのフォーマット](https://www.lazyvim.org/plugins/formatting)
- [Sidekick Extra](https://www.lazyvim.org/extras/ai/sidekick)
- [Overseer Extra](https://www.lazyvim.org/extras/editor/overseer)
