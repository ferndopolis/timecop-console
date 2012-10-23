# Defines extensions applied to ActionController::Base to support our time travel
module TimecopControllerMethods
  def self.included(base)
    base.class_eval do
      around_filter :handle_timecop_offset
    end
  end

  # to be used as an around_filter
  def handle_timecop_offset
    # Establish now
    if session[:timecop_adjusted_time].present?
      Rails.logger.debug "[timecop-console] Time traveling to #{session[:timecop_adjusted_time].to_s}"
      Timecop.travel(session[:timecop_adjusted_time])
    else
      Timecop.return
    end

    # Run the intended action
    yield

    if session[:timecop_adjusted_time].present?
      # we want to continue to slide time forward, even if it's only 3 seconds at a time.
      # this ensures that subsequent calls during the same "time travel" actually pass time
      adjusted_time = Time.now + 3
      Rails.logger.debug "[timecop-console] Resetting session to: #{adjusted_time}"
      session[:timecop_adjusted_time] = adjusted_time
    end
  end

  private :handle_timecop_offset
end
