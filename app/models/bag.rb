class Bag < ApplicationRecord
  #cart_item
  belongs_to :user
  belongs_to :product
end
