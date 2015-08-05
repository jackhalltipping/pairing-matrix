# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

def add_user cohort, name
  params = {username: name,
            email: name.downcase.tr(' ', '_') + '@example.com',
            password: 'password',
            password_confirmation: 'password'}
  cohort.users.create(params)
end

def pair_up users

  if users.length.odd?
    users.unshift('x')
  end

  list_of_pairs = []
  numTimes = users.length - 1

  numTimes.times do
    list_of_pairs << create_day_pairings(users)
    rotate_all_but_first_user_in users
  end

  list_of_pairs
end


def create_day_pairings users
  first_arr = users[0..(users.length/2 - 1)]
  second_arr = users[users.length/2..-1].reverse
  first_arr.zip(second_arr)
end

def rotate_all_but_first_user_in users
  first_user = users.shift
  users.rotate!(-1)
  users.unshift(first_user)
end

june = Cohort.create(name: 'june2015', start_date: Date.new(2015,8,3))
names.each { |name| add_user(june, name) }

all_ids = User.all.map { |user| user.id }
start = june.start_date
round_robin = pair_up(all_ids)

round_robin.each do |day|
  day.each do |pair|
    Pairing.create({day: start, user_id: pair[0], pair_id: pair[1]})
    Pairing.create({day: start, user_id: pair[1], pair_id: pair[0]})
  end
  start += 1
end
