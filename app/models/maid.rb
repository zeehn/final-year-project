class Maid < ApplicationRecord
  has_many :orders, dependent: :destroy 
  has_many :reviews, dependent: :destroy  
  has_secure_password


  validates :first_name, :last_name, :email, :address, :city, :state, :hourly_rate, presence: true

  def name 
    "#{first_name} #{last_name}"
  end


  def average_stars
    reviews.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (self.average_stars / 5.0) * 100
  end

  def has_overlapping_orders?(schedule_date, time_from, time_to)
    orders.where("(schedule_date = ? AND time_from <= ? AND time_to >= ?) OR (schedule_date = ? AND time_from <= ? AND time_to >= ?)",
                   schedule_date, time_to, time_from,
                   schedule_date, time_from, time_to).exists?
  end

end
