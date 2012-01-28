system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/Gemfile -o Gemfile'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/.gitignore -o .gitignore'
system 'curl https://raw.github.com/BrunoGrasselli/rails_template/master/.rspec -o .rspec'
system 'rm public/index.html'

run 'bundle install'

generate 'devise:install'
generate 'devise User'
generate 'rspec:install'

puts 'Done!'
