== README

環境ができてるかのチェック用
```
ruby 2.2.2
rails 4.2.4
```


```
bundle install --path vendor/bundle
```

```
bundle exec rake db:create
```

```
bundle exec rake db:migrate
```

```
bundle exec rake db:seed
```

```
bundle exec rails s
```


これで `http://localhost:3000/`  が動いてればOK


