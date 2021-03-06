require 'spec_helper'

describe TimecopConsole::MainController do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe "POST to :update" do
    let(:timecop_param) do
      {
        'current_time(1i)' => 2012,
        'current_time(2i)' => 11,
        'current_time(3i)' => 30,
        'current_time(4i)' => 22,
        'current_time(5i)' => 01
      }
    end

    it 'redirects back' do
      post :update, :timecop => timecop_param, :use_route => :timecop_console

      response.should redirect_to("where_i_came_from")
    end

    context "with backward compatible format" do
      let(:date_params) do
        { year: 2013, month: 8, day: 22, hour: 12, min: 0, sec: 0 }
      end

      it 'redirects back' do
        post :update, date_params.merge(use_route: :timecop_console)

        response.should redirect_to("where_i_came_from")
      end

      it 'sets virtual time with respect to Time.zone setting' do
        Time.zone = ActiveSupport::TimeZone.all.detect { |tz| tz.name == 'Central Time (US & Canada)' } or raise("can not find TZ")

        post :update, date_params.merge(use_route: :timecop_console)

        session[TimecopConsole::SESSION_KEY_NAME].strftime('%d %b %H:%M %Z').should eq("22 Aug 12:00 CDT")
      end
    end
  end

  describe "GET to :reset" do
    it 'redirects back' do
      get :reset, :use_route => :timecop_console

      response.should redirect_to "where_i_came_from"
    end
  end
end
