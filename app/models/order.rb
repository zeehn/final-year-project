class Order < ApplicationRecord
  belongs_to :client
  belongs_to :maid

  enum status: {
    pending: 0,
    in_progress: 1,
    completed: 2,
    cancelled: 3
  }
  enum pay_type: {
    cash: 0,
    'bank transfer': 1
  }


  validates :schedule_date, :time_from, :time_to, presence: true 
  validate :end_time_after_start_time
  validate :maid_availability
  
  def formatted_pay_type
    pay_type.titleize
  end
private
  def end_time_after_start_time
    return if time_from.blank? || time_to.blank?

    if time_to < time_from
      errors.add(:time_to, "must be after the time from")
    end
  end 
  

  def maid_availability
    if maid&.has_overlapping_orders?(schedule_date, time_from, time_to)
      errors.add(:base, "Maid is not available at the selected time.")
    end
  end  
 


# def overlapping_times 
 #   arel_table[:time_from].lteq(time_to).and(arel_table[:time_to].gteq(time_from))
  #end

  #def maid_availability
   # if Order.exists?(:maid_id => maid_id, :schedule_date => schedule_date, :overlapping_times)
  #    errors.add(:base, "Maid is not available at the selected time")
   # end
#  end

end
