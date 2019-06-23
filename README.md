# はじめてのiOSアプリ開発

2019/06/16 面談時における選考課題

## 概要

- 作成したアプリ
	- 手書き文字解析アプリ
- 開発時間
	- 8時間
- 機能
	- フォトライブラリから画像を取得
	- 手書き文字認識APIに画像を投げて結果を取得
	- ナビゲーションバー


## 今回学んだこと

- iOSアプリ開発作業における具体的なイメージ
- Google Cloud Vison APIの使い方


## 今回のアプリ開発を通じて感じたこと

- iOSの開発に関するドキュメントは多く入門しやすい
- swiftのバージョンによる違いが多い
- storyboadで感覚的に見た目の作業を行える
- ひとつひとつの動作を細かく設定してくUI/UXの設計が難しいのと手間がかかる
	- ただしある程度のお作法のようなものがありそうなのでそこは効率化できそう
- OSリソースへのアクセス許可の確認が必要
- 画面の向きに変換に対しての対応、デバイスごとの見え方を考慮し、オブジェクトの配置などに注意が必要
	- 多くの実機テストが必要となる印象
	- 今回の制作では直接的に関係ないが実際のリリースでは、審査、OSの種類、バージョンなども問題になりうる
- アプリ開発と機械学習を同時に組み込みたかったが機械学習は時間がないため関連するAPIを利用するにとどまった
	- 別の形で機械学習の学習を実施する
- APIのレスポンス結果をxcodeの中でのみの確認になっているので画面に表示できるようにする
- そもそもの構文を全体的に理解すれば、課題解決が早まるので今回はできなかったが基礎はやはり大切