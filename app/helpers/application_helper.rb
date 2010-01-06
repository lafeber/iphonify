# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def show_rss_content(item)
    content = item.try(:content_encoded)
    content ||= item.try(:content)
    content ||= item.try(:description)
    CGI.unescapeHTML(content)
  end

  def get_published_id(item)
    date = item.published
    date ||= item.pubDate
    date.to_i
  end
end
