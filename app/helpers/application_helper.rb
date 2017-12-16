module ApplicationHelper
  def display_time(time)
    time.strftime("at %I:%M%p - %m/%d/%Y")
  end
end
