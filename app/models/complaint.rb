class Complaint < ApplicationRecord 
  belongs_to :maid
  belongs_to :client

  validates :message, length: { minimum: 50 }
end
