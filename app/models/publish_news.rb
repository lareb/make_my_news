class PublishNews < ActiveRecord::Base
   attr_accessible :headline, :category_id, :summary, :photo_id, :embedded_video, :youtube_url, :is_live
   belongs_to :category

   default_scope where(:is_live => true)
end
