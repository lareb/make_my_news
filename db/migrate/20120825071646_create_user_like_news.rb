class CreateUserLikeNews < ActiveRecord::Migration
  def change
    create_table :user_like_news do |t|
      t.integer :user_id
      t.integer :publish_news_id
      t.timestamps
    end
  end
end
