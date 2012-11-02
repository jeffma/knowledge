require_dependency "knowledge/application_controller"

module Knowledge
  class PagesController < ApplicationController
    def index
      @page = Page.find("home")
      @sidebar = Page.find("widgets/sidebar")
    end
  end
end
