class WelcomeEmailJob
  include Sidekiq::Job

  def perform(email, first_name)
    UserMailer.welcome_email(email, first_name).deliver_now
  end
end
