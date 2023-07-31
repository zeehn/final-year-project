class Admin < ApplicationRecord
  has_secure_password

  def first_name 
    full_name.split(" ").first
  end
end
