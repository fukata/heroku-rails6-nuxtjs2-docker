# heroku-rails6-nuxtjs2-docker
Rails v6 + Nuxt.js v2をHerokuにdockerでデプロイするサンプル

## 起動方法

```
docker-compose up --build
```

## セットアップ

```
docker-compose exec api bin/rake db:reset
```

## 各URL

- web: http://localhost:8080
- api: http://localhost:3000

## バージョン

- web
    - node.js: 14.17
- api
    - ruby: 3.0.2

## デプロイ方法

Herokuにdockerを用いたデプロイ方法は下記のヘルプページで提示されている主に3つの方法があります。

https://devcenter.heroku.com/ja/categories/deploying-with-docker

その中でも作業が少ない heroku.yml を使用するパターンにします。

[heroku.yml を使用して Docker イメージをビルドする](https://devcenter.heroku.com/ja/articles/build-docker-images-heroku-yml)

## アプリの作成からデプロイまで

heroku上にアプリを作成します。

```
heroku apps:create --manifest アプリ名
```

stackをcontainerに設定

```
heroku stack:set container --app=アプリ名
```

