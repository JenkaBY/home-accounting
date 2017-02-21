source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'       # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sqlite3'                 # Use sqlite3 as the database for Active Record
gem 'puma', '3.6.2'           # Use Puma as the app server
gem 'sass-rails', '~> 5.0.6'  # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'    # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'  # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'            # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'      # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.5'      # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'devise', '4.2.0'         # Use registration/login/logout functionality
gem 'bootstrap-sass', '3.3.7' # Use Bootstrap sass
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
gem 'rails_admin', '~> 1.0'  # rails_admin for administration
#########################
# ruby '2.3.0'
# gem 'rails', '5.0.0'            # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'puma', '3.6.0'             # Use Puma as the app server
# gem 'sass-rails', '5.0.6'       # Use SCSS for stylesheets
# gem 'uglifier', '3.0.0'         # Use Uglifier as compressor for JavaScript assets
# gem 'coffee-rails', '4.2.1'     # Use CoffeeScript for .coffee assets and views
# gem 'jquery-rails', '4.1.1'     # Use jquery as the JavaScript library
# gem 'turbolinks', '5.0.0'       # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'jbuilder', '2.6.0'         # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'bootstrap-sass', '3.3.7'
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'slim-rails', '3.1.0'
# gem 'devise', '4.2.0'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
