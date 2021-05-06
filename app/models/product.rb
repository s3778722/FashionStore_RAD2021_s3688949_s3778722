class Product < ApplicationRecord
  has_many :product_variants
  has_many :images
  has_and_belongs_to_many :categories
end
