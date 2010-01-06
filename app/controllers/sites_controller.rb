class SitesController < ApplicationController
  layout :smart_layout

  def show
    @site = Site.find_by_name(params[:name])
    begin
      @rss = SimpleRSS.parse open(@site.rss)
    rescue
      render :template => 'sites/notfound'
    end
    entry = params[:entry]
    if entry
      @item = @rss.items.select{|item| item.try(get_published(item)).to_i == entry.to_i}.first
      render :template => 'sites/entry'
    end
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save && verify_recaptcha(@site)
      flash[:notice] = 'Site was successfully created.'
      redirect_to("/#{@site.name}")
    else
      render :action => "new"
    end
  end

  protected
  def smart_layout
    (action_name == 'show') ? 'iphone' : 'application'
  end
end