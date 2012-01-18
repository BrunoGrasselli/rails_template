system "cp ~/projects/rails_template/Gemfile Gemfile"

run "bundle install"

generate "devise:install"
generate "devise User"

puts "Done!"
