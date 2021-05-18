class Bag < ApplicationRecord
  #cart_item
  belongs_to :user
  belongs_to :product
  belongs_to :product_variant
end
