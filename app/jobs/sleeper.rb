class Sleeper
    @queue = :sleeper
    def self.perform(user)
      
      ActiveSupport::Notifications.instrument "event" , { foo: "Notification request working for #{user}" }
      #puts "Sleeping........ #{Time.now} and seconds #{seconds}"
    end
end