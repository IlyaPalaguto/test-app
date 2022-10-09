class ApplicationMailer < ActionMailer::Base
  default from: %{"Test-app" <mail@test-app.com>}
  layout 'mailer'
end
