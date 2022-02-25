class UserMailer < ApplicationMailer
  def welcome_email(email, first_name)
    @first_name = first_name
    mail(to: email, subject: 'Bienvenue sur Cocolis 🎉')
  end
end
