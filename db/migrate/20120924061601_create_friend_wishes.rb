class CreateFriendWishes < ActiveRecord::Migration
  def change
    create_table :friend_wishes do |t|
      t.string  :full_name
      t.string  :email
      t.text    :message
      t.string  :confirmation_passcode
      t.boolean :is_confirm
      t.timestamps
    end
  end
end
