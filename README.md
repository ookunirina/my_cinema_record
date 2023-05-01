# my cinema record

# サービス概要
 自分で見た映画を記録して残しておけます。Twitterで記録をツイートしてシェアできます。映画を見に行きたいと思ったユーザー用に参考資料など見れるサービス。


# メインのターゲットユーザー
 映画好きで見た映画を記録してコレクションとして残しておきたいユーザー、いち早く見た映画をみんなに自慢したいユーザー、またそれを見て映画を見に行きたいと思った時に、他の人の映画の感想を参考にしたいユーザー


# 課題1
見た映画を忘れてしまう。
他の人のオススメ映画を知れない。

# 問題点仮説
既存のアプリの入力が手間。
既存のアプリだとポスター画像のみで思いでせいが低い。
既存のアプリだとユーザー自身に対してのおすすめ映画機能が乏しい。

# 仮説に対する解決策
チェックボックス入力、セレクトボックスにして入力の手間を減らす。
TMDb API使用する。
半チケの写真もしくは、ムビチケ写真で見た映画を記録できる様にする。
マイページに自分が観た映画から他ユーザーのオススメ映画が表示される様にする。


# 実装予定の機能
■ログインページ
- 名前、パスワードでログインできる
- パスワード忘れた時機能

■未登録ユーザー
- 新規登録機能(名前、パスワード)することができる。
- ユーザー達の見た映画記録を見れない。
- 映画を観に行く前情報を閲覧することができる。

■ログインユーザー
- ログイン・ログアウト機能
- マイページを閲覧できる機能
- 他ユーザーの見た映画記録を見れる。
- 映画を観に行く前情報を閲覧することができる。

■ログインユーザーマイページ
- ユーザー名(作成、編集、削除)
- イメージアイコン(作成、編集、削除)
- おすすめ映画(作成、編集、削除)
- 他のユーザーがおすすめしている映画が表示される機能
- 観た映画数ランキング(観た映画が多い上位三名に入れば表示される)
- 見た映画記録できる機能(作成、編集、削除)
　- 半チケの写真もしくは、ムビチケ、映画のポスター画像
　- 映画タイトル
　- ジャンル(セレクトボックスにする)
　- 星評価(5段階評価)
　- 感想
- 見た映画記録できたらツイートできる機能
- ユーザー自身が見た映画記録を閲覧できる機能
　- 記録した映画の検索機能 

■映画を観に行く前情報(各項目内にその内容に応じた映画サイトへのリンクを表示)
- ムビチケについて
- 観に行く曜日について
- 座席について
- 映像技術について(IMAX,4DX,デジタル3D)
- 映画フードについて
- 入場特典について
(他に追加する情報あれば追加)

■管理ユーザー
- ログインログアウト機能
- ユーザーの検索、一覧、詳細、編集、作成、削除
- ユーザーの見た映画記録、一覧、詳細、編集、作成、削除


# なぜこのサービスを作りたいのか？
 映画ファンにとって映画を見ることは楽しいことであり、映画の感想や記録を残すことは、それを振り返ることで楽しい思い出に変わるからです。
 しかし、映画を見た後、忘れてしまったり後から思い出したりする事が難しくなリます。
 このサービスを作る事によりユーザーが簡単に映画の記録を残し、自分だけでなく他の人とも共有することができるようになり、また、映画を見に行く前に他の人の感想や評価を参考にすることができるため、映画鑑賞の情報収集の手間も軽減することができます。
 映画を楽しむ人たちがより充実した映画ライフを送るために、このサービスを作りたいと考えています。


# スケジュール(フルコミットではない)
企画〜技術調査：5/13〆切
README〜ER図作成：5/13 〆切
メイン機能実装：5/14 - 6/14
β版をRUNTEQ内リリース（MVP）：6/17〆切
本番リリース：7/7


# 使用する予定の技術
Rails5
