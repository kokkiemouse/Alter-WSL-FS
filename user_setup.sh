#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo "Alter.exeのパスを入力してください。"
    exit 1
fi
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
EXE_PATH=`wslpath -u $1`

if ask_yes_no "ユーザーを作成します。よろしいですか?"; then
  # ここに「Yes」の時の処理を書く
  echo "Yes"
  echo -n "ユーザー名: "
  read Username
  if ask_yes_no "$Username このユーザー名でよろしいですか?"; then
    useradd -m -g wheel -s /bin/bash ${Username}
    echo "パスワードを設定します。"
    passwd ${Username}
    echo "デフォルトユーザーを設定しています"
    ${EXE_PATH} config --default-user ${Username}
  fi
else
  # ここに「No」の時の処理を書く
  echo "No"
fi