class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.datetime :create_at
      t.datetime :sent_at
      t.datetime :confirmed_at

    end
  end
end
