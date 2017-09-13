class NotificationMailer < ApplicationMailer
  default from: "no-reply@workplacewellbeingfacts.com"

  def user_signed_up
    mail(to: user.email, subject: "The one thing missing from your workplace benefits package...")
  end
end
