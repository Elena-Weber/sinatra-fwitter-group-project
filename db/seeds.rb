User.destroy_all
Tweet.destroy_all

User.create(username: "elena", email: "email@email.com", password: "password")
User.create(username: "greg", email: "email@email.com", password: "password")
User.create(username: "william", email: "email@email.com", password: "password")
User.create(username: "anna", email: "email@email.com", password: "password")
User.create(username: "steve", email: "email@email.com", password: "password")

25.times do
    Tweet.create(
    content: Faker::Movie.quote,
    user_id: rand(1..5)
)
end

puts "Success"