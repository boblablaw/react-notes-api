# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: 'password')
end

10.times do
  Note.create(title: Faker::Name.title, body_text: Faker::Lorem.paragraph(30 + rand(70)), body_html: Faker::Lorem.paragraph(30 + rand(70)), user: User.all.sample)
end

User.create(email: 'jasondavidbeatty@gmail.com', username: 'boblablaw', password: 'password')

10.times do
  Note.create( title: Faker::Lorem.word, body_text: Faker::Lorem.paragraph(30 + rand(70)), body_html: Faker::Lorem.paragraph(30 + rand(70)), user: User.find_by(email: 'jasondavidbeatty@gmail.com') )
end
