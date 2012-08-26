class Category < ActiveRecord::Base
  attr_accessible :name, :display_order

  validates :name, :unique => true, :presence => true
  has_many :publish_news
end
