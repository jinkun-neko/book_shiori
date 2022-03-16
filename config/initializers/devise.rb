Devise.setup do |config|

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], scope: 'email', redirect_uri: "#{ENV['HOST']}/users/auth/google_oauth2/callback"
  OmniAuth.config.logger = Rails.logger if Rails.env.development?

  config.stretches = Rails.env.test? ? 1 : 12
  config.mailer_sender = ENV["GOOGLE_EMAIL"]
  config.send_email_changed_notification = true # <= trueにすると、元のメールへ「メールアドレスの変更確認メール」を送信させる
  config.maximum_attempts = 20 #<= 20回失敗するとアカウントロックするという意味
  config.reconfirmable = true
  config.scoped_views = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
