# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Tomonori HIRATA", email: "hirata.tomonori@j.mbox.nagoya-u.ac.jp", password: "foobar", password_confirmation: "foobar")

50.times do |n|
  first = (0...8).map{ (65 + rand(26)).chr }.join.downcase
  second = (0...8).map{ (65 + rand(26)).chr }.join.downcase
  User.create!(name: "Example-#{n}",
               email: "#{first}.#{second}@a.mbox.nagoya-u.ac.jp",
               password: "foobar",
               password_confirmation: "foobar")
end

users = User.order(:created_at).take(6)
50.times do
  title = (0...25).map{ (65 + rand(26)).chr }.join.downcase
  content = (0...50).map{ (65 + rand(26)).chr }.join.downcase
  users.each { |user| user.microposts.create!(title: title, content: content) }
end
