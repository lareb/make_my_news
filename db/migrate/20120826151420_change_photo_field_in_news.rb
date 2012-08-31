class ChangePhotoFieldInNews < ActiveRecord::Migration
  def up
    remove_column :publish_news, :photo_id
    add_column :publish_news, :news_pic, :string
    add_column :publish_news, :news_pic_file_name, :string
    add_column :publish_news, :news_pic_content_type, :string
    add_column :publish_news, :news_pic_file_size, :integer
  end

  def down
    add_column :publish_news, :photo_id, :integer
    remove_column :publish_news, :news_pic
    remove_column :publish_news, :news_pic_file_name
    remove_column :publish_news, :news_pic_content_type
    remove_column :publish_news, :news_pic_file_size
  end
end
