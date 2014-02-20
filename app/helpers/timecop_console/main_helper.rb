module TimecopConsole
  module MainHelper
    def time_travel_to(date)
      link_to date.strftime("%B %d, %Y"), timecop_console.update_path(timecop:
            {
              'current_time(1i)' => date.year,
              'current_time(2i)' => date.month,
              'current_time(3i)' => date.day,
              'current_time(4i)' => 12,
              'current_time(5i)' => 0
            }), method: :post
    end
  end
end
