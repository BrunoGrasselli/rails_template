system "cp ~/projects/rails_template/Gemfile Gemfile"
system "cp ~/projects/rails_template/.gitignore .gitignore"
system "rm public/index.html"

run "bundle install"

generate "devise:install"
generate "devise User"

puts "Done!"
