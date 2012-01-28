run 'rm -rf test/ public/index.html'
run 'mkdir -p spec/support/factories features/support'
append_file '.gitignore', '*.sw[op]'

run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/Gemfile -o Gemfile'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/application.html.erb -o app/views/layouts/application.html.erb'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/factory_girl.rb -o features/support/factory_girl.rb'

run 'bundle install'

environment %{
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
}, :env => :development

application %{
    config.generators do |g|
      g.test_framework  :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_girl, :dir => 'spec/support/factories'
    end
}

generate 'rspec:install'
generate 'cucumber:install'
generate 'pickle --path --email'
generate 'devise:install'
generate 'devise User'

puts 'Done!'
