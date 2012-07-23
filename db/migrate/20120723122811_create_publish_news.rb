class CreatePublishNews < ActiveRecord::Migration
  def change
    create_table :publish_news do |t|
      t.string :headline, :null => false, :length => 512
      t.integer :category_id
      t.text  :summary, :null => false, :length => 3000
      t.integer :photo_id
      t.text :embedded_video
      t.string :youtube_url
      t.boolean :is_live
      t.timestamps
    end
  end
end
