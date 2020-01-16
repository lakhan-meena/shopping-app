class UserMailer < ApplicationMailer

  def account_activation_email user
    @user = user
    mail(to: 'lakhanmeena170@gmail.com', subject: 'Account activation email')
  end
end
