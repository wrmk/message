require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test "save nill data" do
    message=Notification.new
    assert_not message.save
  end

  test "message doesn`t received" do
    message=Notification.new
    message.greet(1,1)
    assert_not message.doesnt_delivered
  end

  test "message doesn`t send" do
    message=Notification.new
    message.greet(1,1)
    assert_not message.doesnt_send
  end

  test "validates parameters" do
    message=Notification.new
    assert_not message.check_value('c')
    assert_not message.check_value(-1)
    assert_not message.check_value('')
  end




end
