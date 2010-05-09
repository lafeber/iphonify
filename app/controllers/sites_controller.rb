class SitesController < ApplicationController
  layout :smart_layout

  def show
    begin
      @site = Site.find_by_name(params[:name])
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
    siteparams = params[:site].merge!(:rss => get_url(params[:site][:rss]))

    @site = Site.new(siteparams)
    if @site.save && verify_recaptcha(@site)
      flash[:notice] = 'Site was successfully created.'
      render :template => 'sites/success'
    else
      render :action => "new"
    end
  end

  protected
  def smart_layout
    (action_name == 'show') ? 'iphone' : 'application'
  end

  def get_url(page)
    begin
      require 'rubygems'
      require 'mechanize'
      agent = WWW::Mechanize.new
      agent.user_agent_alias = 'Mac Safari' # Not setting an alias will result in a 403
      page = agent.get(page)
      link_array = page.search('//link[@type="application/rss+xml"]')
      link_array ||= page.search('//link[@type="application/rsd+xml"]')
      link = link_array.first['href']
    rescue
      flash[:errors] = 'rss could not be found on your site'
      link = ''
    end
  end
end