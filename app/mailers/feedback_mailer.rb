class FeedbackMailer < ApplicationMailer
  def send_feedback(user, letter)
    @message = letter[:message]
    @subject = letter[:subject]


    mail to: Admin.first.email, from: %{"#{user.email}" <mail@test-app.com>}, subject: @subject
  end
end
