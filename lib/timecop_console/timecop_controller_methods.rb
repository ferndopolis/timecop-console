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
    if session[TimecopConsole::SESSION_KEY_NAME].present?
      Rails.logger.debug "[timecop-console] Time traveling to #{session[TimecopConsole::SESSION_KEY_NAME].to_s}"
      Timecop.travel(session[TimecopConsole::SESSION_KEY_NAME])
    else
      Timecop.return
    end

    # Run the intended action
    yield

    if session[TimecopConsole::SESSION_KEY_NAME].present?
      # we want to continue to slide time forward, even if it's only 3 seconds at a time.
      # this ensures that subsequent calls during the same "time travel" actually pass time
      adjusted_time = Time.now + 3
      Rails.logger.debug "[timecop-console] Resetting session to: #{adjusted_time}"
      session[TimecopConsole::SESSION_KEY_NAME] = adjusted_time
    end
  end

  private :handle_timecop_offset
end
