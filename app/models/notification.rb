class Notification < ApplicationRecord

require 'faker' 
require 'net/http'

def greet
  uri = URI('http://www.example.com/')
  res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
  puts res.code

  puts Faker::Name.name  
  
end
end
