class Product < ApplicationRecord
  has_many :product_variants, dependent: :destroy
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :categories, dependent: :destroy
end
