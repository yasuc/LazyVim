# HyprlandでのYazi画像プレビュー

Neovim内のYaziで画像が点滅する問題を避けるため、Hyprlandへ追加した設定です。Neovim設定だけを移してもHyprlandのルールは反映されないため、別マシンでは以下の手順で追加します。

## 対象環境

- Lua形式の設定に対応したHyprlandとOmarchy。検証環境はHyprland 0.56.2です。
- 通常のパッケージで導入したYaziとÜberzug++。検証環境のÜberzug++は2.9.10です。独自ビルドや専用PATHは不要です。
- このファイルはOmarchyの`o.window`ヘルパーを使います。古い`.conf`形式の環境やOmarchy以外へ、そのままコピーすることはできません。

## 設定内容

ルール本体は[extras/hypr/yazi-image-overlay.lua](extras/hypr/yazi-image-overlay.lua)です。

| 設定 | 目的 |
|---|---|
| `class = ^ueberzugpp.*$`に相当するマッチ | 画像用ウィンドウだけを対象にする |
| `float = true` | 画像をタイル配置から外し、ターミナルの縮小と再描画の繰り返しを防ぐ |
| `no_focus = true` | 画像がキーボードフォーカスを奪うのを防ぐ |
| `no_anim = true` | 表示・非表示時のアニメーションを無効にする |
| `no_blur`／`no_shadow` | 画像に不要なぼかしと影を付けない |
| `border_size = 0`／`rounding = 0` | 画像の枠と角丸をなくす |

Neovim内の画像は、画面中央付近のフローティング表示です。このルールは右プレビューペインへの位置合わせを行いません。ターミナルでYaziを単独起動したときの画像表示方式は変更しません。Überzug++を使う他のアプリの画像用ウィンドウにも、このルールは適用されます。

## 別マシンへの追加手順

1. Omarchyで必要なパッケージを導入します。

   ```sh
   omarchy pkg add yazi ueberzugpp
   ```

2. `~/.config/hypr/hyprland.lua`のバックアップを取ります。

   ```sh
   cp -a ~/.config/hypr/hyprland.lua ~/.config/hypr/hyprland.lua.bak.$(date +%Y%m%d-%H%M%S)
   ```

3. `~/.config/hypr/hyprland.lua`の末尾に、次の行を一度だけ追加します。Omarchyのデフォルト設定を読み込んだ後に置いてください。

   ```lua
   dofile((os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/nvim/extras/hypr/yazi-image-overlay.lua")
   ```

   Neovim設定を別の場所へ配置した場合は、このパスを合わせてください。すでに`yazi-image-overlay`ルールが直接書かれているマシンでは追加不要です。ファイル参照へ切り替える場合は、既存のルールを上の一行へ置き換え、二重登録しないようにします。

4. 再読み込みし、設定エラーがないことを確認します。

   ```sh
   hyprctl reload
   hyprctl configerrors
   ```

5. NeovimでYaziを開き直し、画像を選択して点滅しないことを確認します。

## 無効化

追加した`dofile(...)`の一行を削除し、`hyprctl reload`と`hyprctl configerrors`を実行します。

## 公式資料

- [YaziのNeovim内画像表示](https://yazi-rs.github.io/docs/image-preview/#neovim-users)
- [Hyprlandのウィンドウルール](https://wiki.hypr.land/Configuring/Basics/Window-Rules/)
