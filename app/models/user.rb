class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { maximum: 25}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
    
  validates :password, presence: true, length: { minimum: 8, maximum: 20}


  has_many :favourites, dependent: :destroy
  has_one :bag
end
