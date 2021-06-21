class Notification < ApplicationRecord

require 'faker' 
require 'net/http'

def greet(interval,count)
  (1..count).each do |i|

    message = Faker::Fantasy::Tolkien.poem
    create_time = DateTime.now
    delivery_time = ''

    uri = URI('http://www.example.com/')
    send_time = DateTime.now
    res = Net::HTTP.post_form(uri, 'q' => message, 'max' => '50')

    delivery_time = DateTime.now if res.code == '200'

    notification=Notification.create(create_at: create_time, sent_at: send_time, confirmed_at: delivery_time)
    
    sleep(interval) if i != count
 end 
end


end
