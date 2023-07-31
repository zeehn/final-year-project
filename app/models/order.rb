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

  default_scope { order(created_at: :desc)}
  scope :recent, -> { order(created_at: :desc) }

  def find_total
    # Ensure that time_from and time_to are in the same timezone, or adjust them if needed

    time_from = self.time_from.in_time_zone('Central Time (US & Canada)')
    time_to = self.time_to.in_time_zone('Central Time (US & Canada)')

    # Calculate the duration between time_from and time_to
    duration = time_to - time_from
    # If the maid is hired between 11 PM to 1 AM and the date changes, adjust the duration
    if time_from.hour > time_to.hour
      # Calculate the duration until midnight
      duration_until_midnight = (time_from.end_of_day - time_from).to_i

      # Calculate the duration from midnight to time_to
      duration_from_midnight = (time_to - time_to.beginning_of_day).to_i

      # Calculate the total duration
      duration = duration_until_midnight + duration_from_midnight
    end

    # Convert the duration to hours (duration is in seconds)
    hours = duration / 1.hour
    hours.to_f * self.maid.hourly_rate # Convert to float for more accurate calculations
  end

  def order_number
    "#{id}#{created_at.strftime("%y-%m-%d").split("-").join}"
  end
  
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
