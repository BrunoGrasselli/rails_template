system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/Gemfile -o Gemfile'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/.gitignore -o .gitignore'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/application.rb -o config/application.rb'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/application.html.erb -o app/views/layouts/application.html.erb'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/development.rb -o config/environments/development.rb'
system 'rm -rf test/ public/index.html'
system 'mkdir -p spec/support/factories'

run 'bundle install'

generate 'rspec:install'
generate 'cucumber:install'
generate 'devise:install'
generate 'devise User'

puts 'Done!'
