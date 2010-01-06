class Site < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates_length_of :rss, :maximum => 2050
  validates_uniqueness_of :name, :case_sensitive => false
  validates_format_of :name, :with => /^[0-9a-zA-Z_-]*$/, :on => :create, :message => "Please only use digits, characters, - and _"

  has_attached_file :icon, :styles => { :thumb => "48x48" }

  def apple_touch_icon
    icon.nil? ? "/images/apple-touch-icon.png" : icon.url(:thumb)
  end

  private
  def validate
    begin
      rss = SimpleRSS.parse open(@site.rss)
      first_title = rss.items.first.title
    rescue
      errors.add :rss, 'is not valid or contains zero items'
    end
  end
end
