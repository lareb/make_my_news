class Category < ActiveRecord::Base
  attr_accessible :name, :display_order

  validate :name, :unique => true, :presence => true
end
