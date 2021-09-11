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
