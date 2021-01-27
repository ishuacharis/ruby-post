ActiveSupport::Notifications.subscribe "event" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)
    puts "Notifications working #{event.payload}"
end