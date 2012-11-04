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
  end

  describe "GET to :reset" do
    it 'redirects back' do
      get :reset, :use_route => :timecop_console

      response.should redirect_to "where_i_came_from"
    end
  end
end
