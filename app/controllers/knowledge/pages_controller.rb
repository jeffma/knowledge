# encoding: utf-8
require_dependency "knowledge/application_controller"

module Knowledge
  class PagesController < ApplicationController
    def index
      @page = Page.find("home")
      @sidebar = Page.find("widgets/sidebar")
      @wiki_root = Knowledge.wiki_root_path
      @edit_path = @wiki_root+"/pages/" + 'home' + '/edit'
    end

    def show
      page_path = Page.format_path(params[:page])
      @page = Page.find_or_create(page_path)
      @sidebar = Page.find("widgets/sidebar")
      @wiki_root = Knowledge.wiki_root_path
      @edit_path = @wiki_root+"/pages/" + page_path + '/edit'
    end
    
    def edit
      page_path = Page.format_path(params[:page])
      @page = Page.find_or_create(page_path)
      puts @page.content
      @sidebar = Page.find("widgets/sidebar")
      @wiki_root = Knowledge.wiki_root_path
      @edit_path = @wiki_root +"/pages/"+ page_path + '/edit'
    end

    def update
      page_path = Page.format_path(params[:page])
      @page = Page.find_or_create(page_path)
      @page.update_content(params[:content],page_path)
      @wiki_root = Knowledge.wiki_root_path
      page_show_path = @wiki_root + "/pages/" + page_path
      redirect_to page_show_path
    end
    
    def new
      wiki_root = Knowledge.wiki_root_path
      page_path = wiki_root + "/pages/" + Page.format_path(params[:path]) + "/edit"
      redirect_to page_path
    end

    def preview
      render :text => GitHub::Markdown.render_gfm(params[:data])
    end
  end
end
