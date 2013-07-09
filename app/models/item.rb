class Item < ActiveRecord::Base
  attr_accessible :name, :price, :user_id

  has_many :reviews
  belongs_to :user

  def available?
    self.user.blank?
  end

  def self.available_items?
    available_items = Item.where(:user_id => nil)

    available_items.length > 0
  end
end
