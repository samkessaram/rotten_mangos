class UserMailer < ApplicationMailer
  default from: 'notifications@rottenmangos.com'

  def delete_email(user)
    @user = user
    mail(to: @user.email, subject: "Uh oh")
  end 
end
