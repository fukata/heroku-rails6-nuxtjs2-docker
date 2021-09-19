# heroku-rails6-nuxtjs2-docker
Rails v6 + Nuxt.js v2をHerokuにdockerでデプロイするサンプル

## ファイルの構成

```
.
├── api                 // Railsで作成したAPI
├── docker-compose.yml  // 開発環境用のdocker-compose.yml
└── web                 // Nuxt.jsで作成したフロントエンド、ここからapiを呼ぶ
```

## heroku上の構成

`api`, `web` ともに別アプリとして管理します。

後述しますがデータベースは `api` のアプリの方に作成します。

## 開発環境

### 起動方法

```
docker-compose up --build
```

### セットアップ

```
docker-compose exec api bin/rake db:reset
```

### 各URL

- web: http://localhost:8080
- api: http://localhost:3000

## 本番環境（heroku）

ここでは仮にheroku上のアプリ名を下記としています。各自の環境に合わせて変更してください。

- api: myapp-api
- web: myapp-web

### セットアップ

#### api アプリ

1. heroku上に `api` アプリを作成
    ```
    cd api
    heroku apps:create myapp-api
    git init
    git remote add heroku-api ${herokuのリポジトリURL}
    ```
2. stackの変更
    ```
    heroku stack:set container --app=myapp-api
    ```
3. 環境変数を設定
    ```
    heroku config:set RACK_ENV=production RAILS_ENV=production RAILS_LOG_TO_STDOUT=enabled RAILS_SERVE_STATIC_FILES=enabled RAILS_MASTER_KEY=$(cat config/master.key) --app=myapp-api
    ```
4. Postgresqlアドオンを作成
    ```
    heroku addons:create heroku-postgresql:hobby-dev --app=myapp-api
    ```
5. herokuにデプロイ
    ```
    git push heroku-api
    ```

#### web アプリ

1. heroku上に `web` アプリを作成
    ```
    cd web
    heroku apps:create myapp-web
    git init
    git remote add heroku-web ${herokuのリポジトリURL}
    ```
2. stackの変更
    ```
    heroku stack:set container --app=myapp-web
    ```
3. 環境変数を設定
    ```
    heroku config:set NODE_ENV=production --app=myapp-web
    ```
4. herokuにデプロイ
    ```
    git push heroku-web
    ```

#### 連携

このままだと `web` から `api` にアクセスした時に CORS エラーが発生するので正常に通信できるようにします。

api側の設定

```
heroku config:set WEB_DOMAIN="myapp-web.herokuapp.com" --app=myapp-api
```

web側の設定

```
heroku config:set API_URL="https://myapp-api.herokuapp.com" --app=myapp-web
```
