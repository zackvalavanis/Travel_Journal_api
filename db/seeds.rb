# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# user = User.new(
#   name: 'Zack',
#   email: 'zval321@gmail.com',
#   password: 'password',
#   password_confirmation: 'password'
# )
# user.save 




# post = Post.new(
#   title: 'My first post', 
#   text: 'Hi all, and welcome to my travel blog. This is my first post on the website.',
#   user_id: 1
# )
# post.save

image = Image.new( 
  post_id: 1, 
  image_url: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bG9uZG9ufGVufDB8fDB8fHww"
)
image.save
