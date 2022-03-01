source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2' #rubyのバージョン
gem 'rails', '6.0.3' #railsのバージョン
gem 'bcrypt',       '3.1.13'  #passwordを導入するgem
gem 'puma', '~> 4.1'  #webサーバーを動かすやつ
gem 'dotenv-rails' #環境変数を扱うgem
gem 'sass-rails', '>= 6' #passwordを導入するjem
gem 'webpacker', '~> 4.0'  #いろんなものを一緒にすることで高速化される。
gem 'turbolinks', '~> 5' #画面遷移の高速化
gem 'jbuilder', '~> 2.7' #jsonファイルを管理できるファイル
gem 'carrierwave'  #ファイルをアップロードできるgem
gem 'mini_magick'  #画像を保存できるgem
gem 'rails-i18n' #英語を日本語に翻訳するgem
gem 'bootstrap-sass', '3.3.7' #cssのフレームワーク
gem 'bootsnap', '>= 1.4.2', require: false #起動時間を短縮させる

group :development, :test do
  gem 'mysql2', '>= 0.4.4'  #テスト環境のデータベース
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] #バグをすぐに検出できる
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master' #いろんな仮データを登録できる。
  gem 'forgery_ja' #住所、電話番号を生成でき、多言語対応されており日本語も使えます。
  gem 'factory_bot_rails', '~> 4.10.0' #テスト内で、データを使って統合テストできる。詳しくは,https://qiita.com/at-946/items/aaff42e4a9c2e4dd58ed
end

group :development do
  gem 'web-console', '>= 3.3.0' #デバックするときに、しやすくするgem。詳しくは、https://qiita.com/pekepek/items/74c8b1f4c886fc9b15cd
  gem 'listen', '~> 3.2' #ファイルの変更を通知する。
  gem 'spring' #テストやrakeタスクの起動を高速化してくれる
  gem 'spring-watcher-listen', '~> 2.0.0' #springのファイルシステムの変更検知方法をpollingからlistenに変更してくれる
  gem 'rubocop', require: false # コードを綺麗にするためのフォーマッター。詳しくは,,https://qiita.com/oak1331/items/b28a40bbc3073b2059a5#rubocopの導入
end

group :production do
  gem 'pg' #herokuデプロイ用のDB
end

group :test do
  gem 'rspec-rails', '~> 4.0.0' #rspecのテストフレームワーク
  gem 'spring-commands-rspec' #rspecの高速化
  gem 'capybara', '~> 2.15.4' #ブラウザ上のテストをできるようにするgem
  gem 'webdrivers'  #ブラウザ上のテスト、chormでできるようにする。
  gem 'launchy', '~> 2.4.3'  #ブラウザテストをブラウザで確認できる。
  gem 'guard', '2.16.2'
  gem 'guard-rspec', require: false #テスト自動化
end

# 時間を見やすくコンバートさせるためのもの。
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]