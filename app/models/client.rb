class Client < ApplicationRecord
  has_many :orders, dependent: :destroy 
  has_many :reviews
  has_many :complaints
  has_secure_password

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [street, city, state, country].compact.join(", ")
  end

  enum status: {
    pending: 0,
    active: 1,
    blocked: 2
  }

  def full_name 
    "#{first_name} #{last_name}"
  end

  def address_changed?
    street_changed? || city_changed? || state_changed? || zip_changed?
  end

  def coordinates
    [self.latitude, self.longitude]
  end
end
