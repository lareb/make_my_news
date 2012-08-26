class UserLikeNews < ActiveRecord::Base
  attr_accessible :user_id, :publish_news_id

  validates :user_id, :presence => true #, :numericality => {:only_integer => true}
  validates :publish_news_id, :presence => true #, :numericality => {:only_integer => true}

  belongs_to :publish_news
  belongs_to :user
end
