#!/usr/bin/env bash
function ask_yes_no {
  while true; do
    echo -n "$* [y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;  
      [Nn]*)
        return 1
        ;;
      *)
        echo "yまたはnを入力してください"
        ;;
    esac
  done
}

if ask_yes_no "ユーザーを作成します。よろしいですか?"; then
  # ここに「Yes」の時の処理を書く
  echo "Yes"
  echo -n "ユーザー名: "
  read Username
  if ask_yes_no "$Username このユーザー名でよろしいですか?"; then
    useradd -m -g wheel -s /bin/bash ${Username}
    echo "パスワードを設定します。"
    passwd ${Username}
  fi
else
  # ここに「No」の時の処理を書く
  echo "No"
fi