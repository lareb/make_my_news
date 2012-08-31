class PublishNews < ActiveRecord::Base
   attr_accessible :headline, :category_id, :summary, :embedded_video, :youtube_url, :is_live, :news_pic, :news_pic_file_name, :news_pic_content_type, :news_pic_file_size
   has_attached_file :news_pic, :styles => {:thumb=> "100x100#",:small  => "400x400>" }
   belongs_to :category

   default_scope where(:is_live => true)
end
