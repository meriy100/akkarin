source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'active_hash' # hash model
gem 'therubyracer' # javascript runtime。lessをコンパイルするために必要
gem 'less-rails' # Railsでlessを使えるようにする。Bootstrapがlessで書かれているため
gem 'twitter-bootstrap-rails' # Bootstrapの本体
gem 'bootstrap_form'
# Slim
gem 'slim-rails'
gem "ransack" # 検索
gem "rmagick"

gem 'jpmobile'

gem "chartkick"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem "factory_girl_rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'better_errors'          # エラー画面を見やすくする
  gem 'binding_of_caller'      # better_errorsのエラー画面でREPLが使える
  gem 'tapp'                   # プリントデバッグがしやすくなる
  gem 'pry-rails'              # railsでpryが使える
  gem 'pry-byebug'             # pryでデバックコマンドが使える
  gem 'awesome_print'          # プリントデバッグの出力を整形
  gem 'hirb'                   # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode'           # hirbの日本語対応
  gem 'bcrypt-ruby'
  gem 'rails_best_practices'
  gem 'web-console', '~> 2.0'
  gem 'rspec-rails', '~> 3.3.2'
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'pry-rails'              # railsでpryが使える
  gem 'pry-byebug'             # pryでデバックコマンドが使える
  gem 'awesome_print'          # プリントデバッグの出力を整形
  gem 'hirb'                   # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode'           # hirbの日本語対応
end

