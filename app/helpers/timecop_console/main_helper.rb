module TimecopConsole
  module MainHelper
    def time_travel_to(date, name = nil)
      unless date.respond_to?(:year) && date.respond_to?(:month) && date.respond_to?(:day)
        raise ArgumentError, "Argument must be a Date object"
      end

      hour = if date.respond_to?(:hour)
        date.hour
      else
        12
      end

      min = if date.respond_to?(:min)
        date.min
      else
        0
      end

      name ||= date.strftime("%B %d, %Y")

      update_path = timecop_console.update_path(timecop: {
        'current_time(1i)' => date.year,
        'current_time(2i)' => date.month,
        'current_time(3i)' => date.day,
        'current_time(4i)' => hour,
        'current_time(5i)' => min
      })

      button_to(name, update_path)
    end

    def timecop_console_layout
      render :console_layout, layout: nil
    end
  end
end
