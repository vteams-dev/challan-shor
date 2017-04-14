source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'jbuilder', '~> 2.5'
gem 'twilio-ruby', '~> 4.1.0'

gem 'geocoder'

gem 'pushmeup'
gem 'fcm'
# gem 'rpush'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'pry-rails'
  gem 'annotate'
  gem 'apipie-rails'

  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.2'
  gem 'capistrano-rbenv', '~> 2.0.2'
  gem 'capistrano-bundler', '~> 1.1.3'

end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
