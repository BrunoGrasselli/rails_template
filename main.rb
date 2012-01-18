system "cp ~/projects/rails_template/Gemfile Gemfile"
system "cp ~/projects/rails_template/.gitignore .gitignore"

run "bundle install"

generate "devise:install"
generate "devise User"

puts "Done!"
