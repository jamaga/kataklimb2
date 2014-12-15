# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'


User.create(name: Faker::Name.name, email: 'a@a.test', password: '123', password_confirmation: '123')
User.create(name: Faker::Name.name, email: 'b@b.test', password: '123', password_confirmation: '123')
User.create(name: Faker::Name.name, email: 'c@c.test', password: '123', password_confirmation: '123')


User.create(name: 'zygfryd', email: 'z@z.z', password: '123',password_confirmation: '123', climbing_level: '6a+')
User.create(name: 'wally', email: 'w@w.w', password: '123', password_confirmation: '123', climbing_level: '7a')


Group.create(name: 'normal climbers', climbing_level: '5', creator_id: 1, capacity: '10')
Group.create(name: 'better climbers', climbing_level: '6c', creator_id: 1, capacity: '6')
Group.create(name: 'super climbers', climbing_level: '8a', creator_id: 1, capacity: '9')


Place.create(name: 'all montserrat!', kind: 'conglomerate', location: 'Montserrat, Catalunya')
Place.create(name: 'Siruana', kind: 'limestone', location: 'Siruana, Catalunya')
Place.create(name: 'Oliana', kind: 'granite', location: 'Oliana, Catalunya')