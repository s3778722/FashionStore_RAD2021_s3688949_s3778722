class User < ApplicationRecord
  has_secure_password
  has_many :favourites, dependent: :destroy
  has_many :bags #treat it as bag_items
  
  validates :username, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
    
  validates :password, presence: true, length: { minimum: 8, maximum: 20}, format: { with: /\A[a-zA-Z0-9]*\z/ }
end
