class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.datetime :sent_at
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
