class ApplicationMailer < ActionMailer::Base
  default from:     "SHIORI事務局",
          cc:       "hogehoge@gmail.com"
          bcc:      "hoge_hoge@gmail.com"
  layout 'mailer'
end