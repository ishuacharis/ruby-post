class WelcomeNewUserJob < ApplicationJob
  queue_as :default

  # send mail to user when they login
  # @param User 
  # @return void
  def perform(user)
    # Do something later
    ActiveSupport::Notifications.instrument "event" , { foo: "event firing in welcome user" }
    WelcomeMailer.with(user: user).welcome_email.deliver_now
  end
end
