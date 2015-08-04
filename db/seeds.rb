# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def add_user name
  user = User.new
  user.username = name
  user.email = name.downcase.tr(' ', '_') + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.cohort = 'june2015'
  user.save!
end

names = [
         'Natalia Antonova',
         'Alex Nasr',
         'Christian Miller',
         'Nicola Hughes',
         'David Upsdale',
         'Elin Ng',
         'Faisal Choura',
         'Gerard Morera',
         'Paul Harker',
         'Jack Hall-Tipping',
         'Jonathan Ng',
         'Jonathan Sayer',
         'Kate Wilkinson',
         'Kirsten Jones',
         'Robert Morgan',
         'Simon Legg',
         'Massi Mura',
         'Mohamed Issaq',
         'Natalie Akam',
         'Salman Karim',
         'Lucy Hargrave',
         'Zeina Dajani'
       ]

names.each { |name| add_user(name) }
