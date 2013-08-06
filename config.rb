###
# Blog settings
###

set :markdown_engine, :redcarpet
set :markdown,
 :no_intra_emphasis => true,
 :fenced_code_blocks => true,
 :smartypants => true,
 :prettify => true
activate :livereload
activate :rouge_syntax

Time.zone = "America/Los_Angeles"

activate :blog do |blog|
  # sigh, why did I not do a prefix earlier?
  blog.prefix = ""
  blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"

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

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end


activate :directory_indexes
page "/", :layout => "index"
page "/feed.xml", :layout => false
page "/projects.html", :layout => false
page "/code.html", :layout => "blog_index"

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

#fix RSS feed location
# proxy "/code/feed", "/feed.xml"
proxy "/code/feed/index.xml", "/feed.xml"

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-1004202-1'
end

# activate :disqus do |d|
#   d.shortname = "askedrelic"
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'pic'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

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
