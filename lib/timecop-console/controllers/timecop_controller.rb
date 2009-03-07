
# Because we want to use the session, we need to inherit from ApplicationController
# This is currently very brittle....need to think this one through further.
require_dependency 'application' if Object.const_defined?(:RAILS_ENV)
class TimecopController < ApplicationController
  
  # verify :method => 'post'
  skip_filter :handle_timecop_offset
  
  def update
    year, month, day, hour, min, sec = params[:year], params[:month], params[:day], params[:hour], params[:min], params[:sec]
    session[:timecop_adjusted_time] = Time.local(year, month, day, hour, min, sec)
    render :status => 200, :nothing => true
  end
  
  def reset
    session[:timecop_adjusted_time] = nil
    render :status => 200, :nothing => true
  end
  
end