class Client < ApplicationRecord
  has_many :orders, dependent: :destroy 
  has_many :reviews
  has_secure_password

end
