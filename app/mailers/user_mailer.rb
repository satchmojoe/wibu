class UserMailer < ActionMailer::Base
  default from: "no-reply@wibu.com"

  def password_reset user, tmp
    @user = user
    @tmp_pw = tmp
    mail(:to => user.email, :subject => "Wibu Password Reset")
  end
end
