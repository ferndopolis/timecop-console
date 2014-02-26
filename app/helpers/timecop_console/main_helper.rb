module TimecopConsole
  module MainHelper
    def time_travel_to(date)
      unless date.respond_to?(:year) && date.respond_to?(:month) && date.respond_to?(:day)
        raise ArgumentError, "Argument must be a Date object"
      end

      update_path = timecop_console.update_path(timecop: {
        'current_time(1i)' => date.year,
        'current_time(2i)' => date.month,
        'current_time(3i)' => date.day,
        'current_time(4i)' => 12,
        'current_time(5i)' => 0
      })

      button_to(date.strftime("%B %d, %Y"),
                update_path,
                method: :post)
    end

    def timecop_console_layout
      if Rails.env.development? || Rails.env.staging?
        content_tag(:div, id: "debug-console") do
          concat(yield) if block_given?
          concat(content_tag(:p) {
            raw("<-- #{time_travel_to(24.hours.ago)}") +
            "The time is #{Time.now.to_s(:db)}" +
            raw("#{time_travel_to(24.hours.from_now)} -->");
          })
          concat(form_tag(timecop_console.update_path) {
            concat(content_tag(:p, datetime_select("timecop", "current_time")));
            concat(content_tag(:p, submit_tag( "Time Travel", class: 'btn')));
          })
          concat(link_to("Reset", timecop_console.reset_path))
        end
      end
    end
  end
end
