run 'rm -rf test/ public/index.html'
run 'mkdir -p spec/support/factories features/support'
append_file '.gitignore', '*.sw[op]'

run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/templates/application.html.erb -o app/views/layouts/application.html.erb'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/templates/factory_girl.rb -o features/support/factory_girl.rb'

gem 'devise', '~> 2.0.0'
gem 'thin'

gem_group :test do
  gem 'rspec-rails', '~> 2.8.1'
  gem 'factory_girl_rails', '~> 1.6.0'
  gem 'cucumber-rails', '~> 1.2.1'
  gem 'database_cleaner', '~> 0.7.1'
  gem 'pickle', '~> 0.4.10'
end

environment %{
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
}, :env => :development

application %{
    config.generators do |g|
      g.test_framework  :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_girl, :dir => 'spec/support/factories'
    end
}

run 'bundle install'

generate 'rspec:install'
generate 'cucumber:install'
generate 'pickle --path --email'
generate 'devise:install'
generate 'devise User'

%w{development test}.each do |env|
  rake 'db:migrate', :env => env
end

git :init
git :add => '.'
git :commit => '-a -m "Initial commit"'

puts 'Done!'
