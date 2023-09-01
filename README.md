# My Cinema rRecord

# サービス概要
 自分で観た映画を記録して残しておけます。Twitterで記録をツイートしてシェアできます。映画を観に行きたいと思ったユーザー用に参考資料など見れるサービス。


# メインのターゲットユーザー
 映画好きで観た映画を記録してコレクションとして残しておきたいユーザー、いち早く観た映画をみんなに自慢したいユーザー、またそれを見て映画を観に行きたいと思った時に、他の人の映画の感想を参考にしたいユーザー


# 課題1
観た映画を忘れてしまう。
他の人のオススメ映画を知れない。

# 問題点仮説
既存のアプリの入力が手間。
既存のアプリだとポスター画像のみで思いでせいが低い。
既存のアプリだとユーザー自身に対してのオススメ映画機能が乏しい。

# 仮説に対する解決策
ラジオボタンにして入力の手間を減らす。
TMDb API使用する。
半チケの写真もしくは、ムビチケ写真で観た映画を記録できる様にする。
マイページにて、他ユーザーのオススメ映画が見れるページが表示される様にする。


# 実装予定の機能
■ログインページ
- メールアドレス、パスワードでログインできる
- パスワード忘れた時機能

■未登録ユーザー
- 新規登録機能(名前、メールアドレス、パスワード)することができる。
- ユーザー達の観た映画記録を見れない。
- 映画を観に行く前情報を閲覧することができる。
- ユーザー達の観た映画記録数、ランキングを閲覧することができる。
- 映画検索＆上映されている映画、動画配信サイトで観れる最新映画を閲覧することができる。


■ログインユーザー
- ログイン・ログアウト機能
- マイページを閲覧できる機能
- 他ユーザーの観た映画記録を見れる。
- ユーザー達の観た映画記録数、ランキングを閲覧することができる。
- 映画を観に行く前情報を閲覧することができる。
- 映画検索＆上映されている映画、動画配信サイトで観れる最新映画を閲覧することができる。
- いいね機能
　- 他ユーザーが見た映画の記録をいいねすることができる。

■ログインユーザーマイページ
- ユーザー名(作成、編集、削除)
- イメージアイコン(作成、編集、削除)
- カレンダー機能(作成、編集、削除)
(gem SimpleCalendarを使用予定)
- 他ユーザー達のオススメ映画ランダム3つを閲覧することができる。
- 観た映画記録できる機能(作成、編集、削除)
　- 半チケの写真もしくは、ムビチケ、映画のポスター画像
　- 映画タイトル
　- 視聴方法(ラジオボタン)
　- 星評価(5段階評価)
　- タグ(オススメタグを付けると他のユーザーがオススメしている映画ページでランダムで３つ表示される)
　- 感想
- 観た映画記録できたらツイートできる機能
- ユーザー自身が観た映画記録を閲覧できる機能
　- 記録した映画の検索機能 

■映画を観に行く前情報(各項目内にその内容に応じたサイトへのリンクを表示)
- ムビチケカードについて
- 映画を観に行く日で料金が安くなる!
- 映画パンフレットについて
- 座席について
- 映像技術について
- 映画関連イベントについて
(他に追加する情報あれば随時追加していく)

■管理ユーザー
- ログインログアウト機能
- ユーザーの検索、一覧、詳細、編集、削除
- ユーザーの観た映画記録、一覧、詳細、編集、削除


# なぜこのサービスを作りたいのか？
 映画ファンにとって映画を観る事は、楽しい事であり、映画の感想や記録を残す事は、それを振り返ることで楽しい思い出に変わるからです。
 しかし、映画を観た後、忘れてしまったり後から思い出したりする事が難しくなリます。
 このサービスを作る事によりユーザーが簡単に映画の記録を残し、自分だけでなく他の人とも共有することができるようになり、また、映画を観に行く前に映画情報、他の人の感想や評価を参考にする事ができる為、映画鑑賞の情報収集の手間も軽減する事ができます。
 映画を楽しむ人たちがより充実した映画ライフを送るために、このサービスを作りたいと考えています。


# スケジュール(フルコミットではない)
企画〜技術調査：5/13〆切
README〜ER図作成：5/13 〆切
メイン機能実装：5/14 - 6/14
β版をRUNTEQ内リリース（MVP）：6/17〆切
本番リリース：7/7


# 使用する予定の技術
Rails7

# 画面遷移図
https://www.figma.com/file/6mhiau7jFO9BIFwxGoW5Fl/%E7%84%A1%E9%A1%8C?type=design&node-id=0%3A1&mode=design&t=YGD2OeusxeT1EHZk-1

# ER図
[![Image from Gyazo](https://i.gyazo.com/dab095fd5f149c7a7b273a6dd3862e2a.png)](https://gyazo.com/dab095fd5f149c7a7b273a6dd3862e2a)