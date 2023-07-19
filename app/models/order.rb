class Order < ApplicationRecord
  belongs_to :client
  belongs_to :maid

  enum order_status: {
    pending: 0,
    inprogress: 1,
    completed: 2,
    cancelled: 3
  }
  enum pay_type: {
    cash: 0,
    'bank transfer': 1
  }


  validates :schedule_date, :time_from, :time_to, presence: true, availability: true 
  validate :end_time_after_start_time

private
  def end_time_after_start_time
    return if time_from.blank? || time_to.blank?

    if time_to < time_from
      errors.add(:time_to, "must be after the time from")
    end
  end 
end
