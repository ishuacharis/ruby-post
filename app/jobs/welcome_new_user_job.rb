class WelcomeNewUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    WelcomeMailer.with(user: user).welcome_email.deliver_now
  end
end
