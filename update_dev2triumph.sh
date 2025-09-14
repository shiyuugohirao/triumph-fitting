#!/bin/bash

# dev.htmlから<body>要素を抜き出してtriumph-fitting-data.htmlに上書きし、prettierで整形するスクリプト

echo "Starting update process..."

# 現在のディレクトリを確認
if [ ! -f "dev.html" ]; then
    echo "Error: dev.html not found in current directory"
    exit 1
fi

# dev.htmlから<body>要素の内容を抜き出し（<body>と</body>タグは除外）
echo "Extracting body content from dev.html..."

# <body>タグの開始行と終了行を動的に検索
BODY_START=$(grep -n '<body' dev.html | head -1 | cut -d: -f1)
BODY_END=$(grep -n '</body>' dev.html | head -1 | cut -d: -f1)

if [ -z "$BODY_START" ] || [ -z "$BODY_END" ]; then
    echo "Error: <body> or </body> tag not found in dev.html"
    exit 1
fi

# <body>タグの次の行から</body>タグの前の行までを抽出
BODY_CONTENT_START=$((BODY_START + 1))
BODY_CONTENT_END=$((BODY_END - 1))

echo "Found body content from line $BODY_CONTENT_START to $BODY_CONTENT_END"
sed -n "${BODY_CONTENT_START},${BODY_CONTENT_END}p" dev.html > temp_body.html

# triumph-fitting-data.htmlに上書き
echo "Overwriting triumph-fitting-data.html..."
mv temp_body.html triumph-fitting-data.html

# prettierで整形
echo "Formatting with prettier..."
npx prettier --write triumph-fitting-data.html

echo "Update completed successfully!"
echo "triumph-fitting-data.html has been updated and formatted."
