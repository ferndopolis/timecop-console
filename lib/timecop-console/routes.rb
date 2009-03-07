module ActionController
  module Routing #:nodoc:
    class RouteSet #:nodoc:
      alias_method :draw_without_timecop_routes, :draw
      def draw
        draw_without_timecop_routes do |map|

          map.update_time '/timecop/update', :controller => 'timecop', :action => 'update'
          map.reset_time '/timecop/reset', :controller => 'timecop', :action => 'reset'

          yield map if block_given?
        end
      end
    end
  end
end
