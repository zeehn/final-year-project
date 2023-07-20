class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def name 
    "#{first_name} #{last_name}".titleize
  end
  
  def format_address
    address.titleize
  end

end
