class Notification < ApplicationRecord
  validates :create_at, :sent_at, :confirmed_at, presence: true


  require 'faker' 
  require 'net/http'

  def greet(interval,count)
    
   if !check_value(interval) or !check_value(count) then abort("Введите корректные значения интервала и количества сообщений") end
    
    (1..count).each do |i|
      message = Faker::Fantasy::Tolkien.poem
      create_time = DateTime.now
      @send_time = ''
      @delivery_time = ''

      uri = URI('http://www.example.com/')
      res = Net::HTTP.post_form(uri, 'q' => message, 'max' => '50')
      

      @send_time = DateTime.now
      @delivery_time = DateTime.now if res.code == '200'
      

      notification=Notification.create(create_at: create_time, sent_at: @send_time, confirmed_at: @delivery_time)
      
      sleep(interval) if i != count
      
   end 
  end

  def check_value(x)
    !x.nil? and x.is_a?(Integer) and x.to_i>0 ? true : false
  end

  def doesnt_delivered
    @delivery_time == ''
  end

  def doesnt_send
    @send_time == ''
  end


end
