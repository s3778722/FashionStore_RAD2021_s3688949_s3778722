class User < ApplicationRecord
  has_one :saved_list
  has_one :bag
end
