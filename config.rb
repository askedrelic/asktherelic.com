###
# Blog settings
# Docs: https://middlemanapp.com/basics/install/
###

# ooooh ruby https://github.com/middleman/middleman/issues/2002
#Tilt::SYMBOL_ARRAY_SORTABLE = false

activate :syntax

set :markdown_engine, :redcarpet
set :markdown,
 :no_intra_emphasis => true,
 :fenced_code_blocks => true,
 :smartypants => true,
 :prettify => true

Time.zone = "America/Los_Angeles"

activate :blog do |blog|
  # sigh, why did I not do a prefix earlier?
  blog.prefix = ""
  blog.permalink = ":year/:month/:day/:title.html"

  # use this layout for blog articles
  blog.layout = "blog_post"
  # tags/calender assume default layout; layout.erb

  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 0
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.publish_future_dated = true
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end
# Need to activate after blog
activate :directory_indexes

page "/", :layout => "index"
# /feed is a 301 in nginx
page "/feed.xml", :layout => false
page "/projects.html", :layout => false
page "/code.html", :layout => "blog_index"

# Make previous RSS feed works
proxy "/code/feed/index.xml", "/feed.xml"
# 2024 feed location
proxy "/code/feed.xml", "/feed.xml"

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'pic'

##### Build-specific configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

configure :build do

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  activate :gzip
  activate :minify_html
end
