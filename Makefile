.PHONY: build run bootstrap

build:
	bundle exec middleman build
run:
	bundle exec middleman
	

# assume mise/ruby is active
bootstrap:
	mise install
	bundle 
# bootstrap:
#     rbenv install
#     rbenv rehash
#     gem install bundler
#     brew install openssl@1.1
#     pkg_config_path="$(brew --prefix openssl@1.1)/lib/pkgconfig" gem install eventmachine
