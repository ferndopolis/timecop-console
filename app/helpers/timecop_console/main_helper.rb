module TimecopConsole
  module MainHelper
    def time_travel_to(date, name = nil)
      unless date.respond_to?(:year) && date.respond_to?(:month) && date.respond_to?(:day)
        raise ArgumentError, "Argument must be a Date object"
      end

      name ||= date.strftime("%B %d, %Y")
      hour = date.respond_to?(:hour) ? date.hour : 12
      min = date.respond_to?(:min) ? date.min : 0

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
