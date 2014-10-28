# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


User.create(name: Faker::Name.name, email: 'a@a.test', password: '123')
User.create(name: Faker::Name.name, email: 'b@b.test', password: '123')
User.create(name: Faker::Name.name, email: 'c@c.test', password: '123')


3.times do
	Group.create(name: Faker::Name.name)
end



