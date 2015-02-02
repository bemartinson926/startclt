module ApplicationHelper

  def pretty_datetime(dt)
    # Change to Eastern Time, because Charlotte
    dt = dt.in_time_zone("Eastern Time (US & Canada)")
    
    # "01/24/2015 at 11:05am"
    # dt.strftime("%m/%d/%Y at %l:%M%P")

    # "Saturday, Jan. 24 at 11:05 AM"
    dt.strftime("%A, %b. %d at %l:%M%P")
  end

end
