class Review < ApplicationRecord
  belongs_to :maid
  belongs_to :client

  STARS = [1, 2, 3, 4, 5]

  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
