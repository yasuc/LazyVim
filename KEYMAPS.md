# Neovim 機能・キー操作一覧

2026-10-28の設定整理後の主な機能です。`Space`はスペースキーを表します。

| 機能 | キー・コマンド | 動作 |
|---|---|---|
| Yazi | `Space go` | 現在のファイルの場所を開く |
| Yazi | `Space gO` | 作業ディレクトリを開く |
| OpenCode | `Space ao` | 質問入力欄を開く |
| OpenCode | `Space aO` | アクションを選ぶ |
| OpenCode | `go`＋移動操作／`goo` | 範囲／現在行を送る |
| CopilotChat | `Space ah` | チャットの表示・非表示 |
| CopilotChat | `Space aP` | 日本語プロンプトなどを選ぶ |
| Sidekick | `Space aa` | AI CLIの表示・非表示 |
| Sidekick | `Space as` | 使用するAI CLIを選ぶ |
| Sidekick | `Space ap` | プロンプトを選ぶ |
| uv | `Space V`／`Space Vr` | メニュー／Pythonファイルの実行 |
| Markdown | `Space um` | エディタ内の装飾表示を切り替える |
| Markdown | `Space cp` | ブラウザプレビューを切り替える |
| シンボル一覧 | `Space cs` | Aerialを開閉する |
| Surround | `gsa`／`gsd`／`gsr` | 囲み文字の追加／削除／置換 |
| 補完・スニペット | `Tab`／`Shift-Tab` | 候補選択・スニペット内の移動 |
| 数値などの増減 | `Ctrl-a`／`Ctrl-x` | Dialで増加／減少 |
| SKK日本語入力 | `Ctrl-j` | 日本語入力を有効にする |
| SKK日本語入力 | `Ctrl-@`、またはひらがな入力中に`l` | 英数入力に戻る |
| Git差分 | `:DiffviewOpen` | 差分画面を開く |
| Git履歴 | `:DiffviewFileHistory` | ファイル履歴を開く |
| コード実行 | `:Jaq` | 現在のファイルを実行する |

## 補足

- Yaziの画像は中央のフローティング表示です。
- Copilot関連機能にはGitHub認証が必要です。`:Copilot auth`から設定できます。
- uvのキーはPythonファイルを開くか、UV系コマンドでプラグインを読み込むと有効になります。
- OpenCodeの質問入力欄は`Esc`で閉じられます。ターミナル画面を非表示にするには、`Ctrl-\` → `Ctrl-n`でノーマルモードへ戻り、`:hide`を実行します。
- `Ctrl-@`は、端末によって`Ctrl-Space`でも入力できます。

## SKK辞書の保存先

- 共通辞書：`~/.local/share/nvim/skk/SKK-JISYO.L`
- 学習用辞書：`~/.local/share/nvim/skk/SKK-JISYO.user`
- 既存の`~/.skkeleton`がある場合は、そちらを個人辞書として使用します。

## 別の環境へ設定を移す場合

共通辞書はリポジトリに含めていません。次のコマンドで[SKK公式辞書](https://github.com/skk-dev/dict)を配置できます（既存の共通辞書は上書きされます）。学習用辞書はskkeletonが別ファイルに保存します。

```sh
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/skk"
curl -fL https://raw.githubusercontent.com/skk-dev/dict/master/SKK-JISYO.L \
  -o "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/skk/SKK-JISYO.L"
```

- skkeletonにはDenoが必要です。初回使用時にはdenopsの依存パッケージを取得するためのネット接続も必要です。
- Neovim内のYazi画像プレビューには、Wayland環境では標準パッケージのÜberzug++を使用します。独自ビルドや専用PATHの設定は使っていません。
- この環境の中央フローティング表示と点滅防止は、リポジトリ外の`~/.config/hypr/hyprland.lua`にある画像用ウィンドウルールにも依存します。
