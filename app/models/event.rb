class Event < ApplicationRecord
  belongs_to :event_image

  accepts_nested_attributes_for :event_image, reject_if: proc {|attributes| attributes[:first].blank || attributes[:last].blank?}

  def format_event_dateXXX()
    if (event_start.strftime("%Y-%m-%d") == event_end.strftime("%Y-%m-%d"))
      rv = event_start.strftime("%A %B %e %l:%M%P") + event_end.strftime(" - %l:%M%P") 
    else
      rv = event_start.strftime("%A %B %e %l:%M%P") + event_end.strftime(" - %A %B %e %l:%M%P") 
    end
    return rv 
  end

  def html_event_dateXXX()
    if (event_start.strftime("%Y-%m-%d") == event_end.strftime("%Y-%m-%d"))
      rv = 
           '<div class="EventDateTime">' + 
             '<span class="Date">' + 
               event_start.strftime("%A %B %e") + 
             '</span>' + 
             '<span class="Time">' + 
               event_start.strftime("%l:%M%P") + event_end.strftime(" - %l:%M%P") +
             '</span>' + 
          '</div>'
    else
      rv = event_start.strftime("%A %B %e %l:%M%P") + event_end.strftime(" - %A %B %e %l:%M%P") 
           '<div class="EventDateTime">' + 
             '<span class="StartDate">' + 
                 event_start.strftime("%A %B %e %l:%M%P") + 
             '</span>' + 
             '<span class="EndDate">' + 
                event_end.strftime(" %A %B %e %l:%M%P") +
             '</span>' + 
          '</div>'
    end
    return rv 
  end
end

