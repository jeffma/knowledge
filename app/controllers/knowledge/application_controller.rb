module Knowledge
  class ApplicationController < ActionController::Base
    before_filter :set_current_app
    def set_current_app
      session[:current_app] = "wiki"
    end
  end
end
