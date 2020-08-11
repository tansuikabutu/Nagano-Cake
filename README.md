Name

ながのケーキ(ECサイト)

サイトについて

洋菓子を扱う店舗を想定し、顧客の新規登録から購入、退会までの一連の動作に加え、管理者の商品作成から販売、顧客管理までを扱えるように作成。

-用語-

・顧客　ながのCAKEの商品を購入する人

・会員　ECサイトにユーザー登録している顧客

・ECサイト　顧客が利用するサイト

・管理サイト　従業員が利用するサイト

・ステータス　注文と制作状況を管理するステータス

---搭載機能一覧---

—管理者—


・新規登録、ログイン

・商品(画像、商品名、商品詳細、価格）　新規追加　編集　一覧　詳細

・商品ジャンルの作成、編集

・販売ステータスの変更

・制作ステータスの変更

・顧客(登録者)の確認、編集


—顧客—


・新規登録、ログイン

・商品の閲覧

・購入商品をカートに入れる(ログイン時のみ）

・購入方法の選択

・登録情報の確認、編集

・配送先の登録、編集

・購入履歴の確認


--使用言語--


・HTML 

・CSS

・Ruby

・Javascript


--使用ライブラリ--

・devise

・kaminari

・bootstrap

・jquery-rails

・font-awesome-rails

・refile, require: "refile/rails", github: 'manfe/refile'

・enum_help


インストール方法


上記記載のライブラリを各フォームからダウンロード後
bundel installを行う

・git clone git@github.com:tansuikabutu/Nagano-Cake.git

・cd Nagano-Cake

・rails db:maigrate

・rails s -b 0.0.0.0

Author

—-製作者—-

岩井將輝　　古瀬 良太　　七戸秀一　　松榮美帆

—-所属—-

DMM webcamp受講生
