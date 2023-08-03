class Client < ApplicationRecord
  has_many :orders, dependent: :destroy 
  has_many :reviews
  has_many :complaints
  has_secure_password


  enum status: {
    pending: 0,
    active: 1,
    blocked: 2
  }

  def full_name 
    "#{first_name} #{last_name}"
  end


end
