# LiveMatching


## サイト概要
LiveMatchingは、アーティストのライブやコンサートへ一緒に参加する仲間を探す・同じアーティストが好きな人とコミュニケーションを楽しむことが出来るSNSサイトです。<br>

<!--1. ユーザーが参加イベントの予定を追加する-->
<!--1. 他のユーザーが参加日・アーティスト名などで検索-->
<!--1. メッセージを送り、やりとりを行う事が出来る-->
<!--* また、ユーザーをフォローするとブログの閲覧・コメント等が出来る-->
<!--* カレンダー機能により、参加するイベントのスケジュールを確認する事が出来る-->


### テーマを選んだ理由
私は昔から、ライブやコンサートに参加することが好きでしたが、周りに同じアーティストが好きな人がおらず、一人で参加する事もありました。<br>
一人でも充分楽しいですが、やはり同じアーティストが好きな方と友達になり、語り合うことが出来れば、楽しさが倍増するかと思います。<br>
そこで、同じような想いの人達が集まり、よりライブやコンサートを楽しむことが出来ればと考え、本サイトの製作に至りました。<br>

### ターゲットユーザー
ライブ・コンサートに行く予定がある人。また、同じアーティストが好きな人とコミュニケーションを取りたい人。<br>

### 利用方法
* ライブ・コンサートを一緒に楽しむ仲間を探したいとき<br>
  TOPページ(ログイン時のみ)・ヘッダーの『ユーザーを探す』をクリックし、検索画面から参加日・キーワードを入力し探すことが出来ます。
<img width="1421" alt="スクリーンショット 2021-07-04 13 43 11" src="https://user-images.githubusercontent.com/78466325/124373646-02e78380-dccf-11eb-8061-ef4f00bb06fb.png" width="45">
<img width="1425" alt="スクリーンショット 2021-07-04 13 44 12" src="https://user-images.githubusercontent.com/78466325/124373648-067b0a80-dccf-11eb-8705-ada964618cbf.png" width="45">
  また、ヘッダーの『今後の予定』から自分の予定を登録しておくと、他のユーザーが検索することが出来ます。
  予定を登録するとカレンダーにも書き込まれ、後からスケジュールを確認することが出来ます。<br>
<img width="1422" alt="スクリーンショット 2021-07-04 14 02 15" src="https://user-images.githubusercontent.com/78466325/124373852-e77d7800-dcd0-11eb-9183-88f3d55122c5.png">
<img width="1424" alt="スクリーンショット 2021-07-04 14 02 32" src="https://user-images.githubusercontent.com/78466325/124373853-e9dfd200-dcd0-11eb-83aa-2928b48cfecf.png">


* 同じアーティストが好きな仲間と話したいとき<br>
ユーザーを検索し、『詳細を見る』をクリックすると、詳細画面からメッセージを送ることが出来ます。
<img width="1424" alt="スクリーンショット 2021-07-04 14 09 13" src="https://user-images.githubusercontent.com/78466325/124374043-df263c80-dcd2-11eb-8a7f-0718d6e1c11c.png">

また、名前をクリックするとユーザーのプロフィールを見たり、フォローすることが出来ます。
フォローするとブログの閲覧・コメントが出来ます。
<img width="1424" alt="スクリーンショット 2021-07-04 14 24 15" src="https://user-images.githubusercontent.com/78466325/124374133-a5a20100-dcd3-11eb-951f-03908849041e.png">
<img width="1423" alt="スクリーンショット 2021-07-04 14 10 25" src="https://user-images.githubusercontent.com/78466325/124374056-f6652a00-dcd2-11eb-98cb-688f2eedcd4c.png">



<!--## 設計書-->


## 機能・導入技術一覧
* ユーザー登録・ログイン(devise)
* CRUD処理
* 検索(キーワード検索・日付検索)
* カレンダー(simple_calendar)
* 画像複数アップロード(refile)
* 画像拡大(refile)
* フォロー
* いいね
* コメント
* 非同期通信
* 多言語化
* ページネーション
* データベース(MySQL)

詳細は以下のリンク先よりご確認下さい。
https://docs.google.com/spreadsheets/d/1eGhI3HBideuCybgW1rKg8_RKIYBy6qsG1dp22I7r-FU/edit#gid=0

## URL
http://livematching.work/

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
* いらすとや(https://www.irasutoya.com/)
* Unsplash(https://unsplash.com/)
* お名前.com(https://www.onamae.com/)