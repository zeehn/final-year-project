class Maid < ApplicationRecord
  has_many :orders, dependent: :destroy 
  has_many :reviews, dependent: :destroy  
  has_secure_password
  def name 
    "#{first_name} #{last_name}"
  end


  def average_stars
    reviews.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (self.average_stars / 5.0) * 100
  end
end
