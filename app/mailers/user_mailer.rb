class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user 
    @url  = 'https://example.com' 
    mail(to: @user.email, subject: 'Bienvenue !') 
  end

  def reset_password_email(user)
    @user = user  
    @url ="https://follownut.herokuapp.com/password-reset-user/#{user.reset_password_token}"
    mail(to: @user.email, subject: "Mot de passe oublié'") 
  end

  def goodbye_email(user)
    @user = user 
    @url  = 'https://follownut.herokuapp.com/' 
    mail(to: @user.email, subject: "Ce n'est qu'un au revoir") 
  end

end
