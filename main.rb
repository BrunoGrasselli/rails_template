run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/Gemfile -o Gemfile'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/.gitignore -o .gitignore'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/application.rb -o config/application.rb'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/application.html.erb -o app/views/layouts/application.html.erb'
run 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/development.rb -o config/environments/development.rb'
run 'rm -rf test/ public/index.html'
run 'mkdir -p spec/support/factories'

run 'bundle install'

generate 'rspec:install'
generate 'cucumber:install'
generate 'devise:install'
generate 'devise User'

puts 'Done!'
