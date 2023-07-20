module OrdersHelper
  def format_time(time)
    time.strftime("%I:%M %p")
  end
  
  def format_status(status)
    status.split("_").join(" ").titleize
  end

end
