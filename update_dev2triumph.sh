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
sed -n '4,1237p' dev.html > temp_body.html

# triumph-fitting-data.htmlに上書き
echo "Overwriting triumph-fitting-data.html..."
mv temp_body.html triumph-fitting-data.html

# prettierで整形
echo "Formatting with prettier..."
npx prettier --write triumph-fitting-data.html

echo "Update completed successfully!"
echo "triumph-fitting-data.html has been updated and formatted."
