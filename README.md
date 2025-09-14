# triumph fitting

- 2025/09
- #トリンプで試着したら人生変わったわ

- [Notion](https://www.notion.so/aiddcc/Triumph-262fcbc77fb280d0b45af1d5b4006edc#262fcbc77fb280d0b45af1d5b4006edc)
- [Figma](https://www.figma.com/files/project/445158443)

## development

### VSCode (Cursor)

- Prettier で整形
- cSpell でスペルチェック

### 開発フロー

1. `dev.html` を編集

- LiveServer でプレビュー （https://localhost:5500/dev.html など）

2. `update_dev2triumph.sh` を実行して、`dev.html` から body 要素のみを抜き出した本番コピペ用の `triumph-fitting-data.html` が更新される。

3. Salesforce にて、`triumph-fitting-data.html` の内容をコピペ。

- Salesforce アカウントは TH 佐々木経由で発行してもらった。
- 詳細情報は[Notion の開発メモ](https://www.notion.so/aiddcc/triumph-2025-265fcbc77fb2809b895ad4c5f63f1b7d)に記載。

- ※ LiveServer でプレビューしたい。が、html 要素として最低限の記述がないと、LiveServer では Javascript が正しく読み込まれなかった。

---
