class Notification < ApplicationRecord

require 'faker' 
require 'net/http'

def greet(interval,count)
  count.times do

    delivery_time = ''
    create_time = DateTime.now

    message = Faker::Fantasy::Tolkien.poem
    uri = URI('http://www.example.com/')
    send_time = DateTime.now
    res = Net::HTTP.post_form(uri, 'q' => message, 'max' => '50')

    delivery_time = DateTime.now if res.code == '200'

    puts send_time
    notification=Notification.create(create_at: create_time, sent_at: send_time, confirmed_at: delivery_time)
    sleep(interval)
 end 
end


end
