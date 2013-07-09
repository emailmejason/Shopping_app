class Review < ActiveRecord::Base
  attr_accessible :content, :user_id, :item_id

  belongs_to :user
  belongs_to :item

end
