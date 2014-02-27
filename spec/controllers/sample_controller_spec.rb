require 'spec_helper'

describe SampleController do
  describe "GET to :index" do
    controller do
      def index
        render :nothing => true
      end
    end

    it 'calls around filter method' do
      controller.should_receive(:handle_timecop_offset)

      get :index
    end
  end

  describe "#handle_timecop_offset" do
    controller do
      def index
        raise Time.zone.now.to_s
      end
    end

    it 'sets proper time inside action method' do
      frozen_time = 1.year.from_now

      session[TimecopConsole::SESSION_KEY_NAME] = frozen_time

      expect { get :index }.to raise_error(frozen_time.to_s)
    end
  end
end
