source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "http"
gem "rails", "~> 5.0.2"
gem "mysql2"
gem "puma", "~> 3.0"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
	gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
