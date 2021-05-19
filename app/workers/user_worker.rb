class UserWorker

    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(seconds)
        ActiveSupport::Notifications.instrument "event" , { foo: "Notification sidekiq working" }
        puts "Sleep........ #{Time.now} and seconds #{seconds} "
    end
end