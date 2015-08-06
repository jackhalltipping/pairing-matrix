# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

people = [
         {name: 'Natalia Antonova', github: '5555482'},
         {name: 'Alex Nasr', github: 'aleckz'},
         {name: 'Christian Miller',github: 'cwgmiller'},
         {name: 'Nicola Hughes', github: 'DataMinerUK'},
         {name: 'David Upsdale', github: 'duskyshelf'},
         {name: 'Elin Ng', github: 'elinnet'},
         {name: 'Faisal Choura', github: 'FaisalChoura'},
         {name: 'Gerard Morera', github: 'gerard-morera'},
         {name: 'Paul Harker', github: 'Harxy'},
         {name: 'Jack Hall-Tipping', github: 'jackhalltipping'},
         {name: 'Jonathan Ng', github: 'jonathanngkh'},
         {name: 'Jonathan Sayer', github: 'jonathansayer'},
         {name: 'Kate Wilkinson', github: 'KateWilkinson'},
         {name: 'Kirsten Jones', github: 'katsuraku'},
         {name: 'Robert Morgan', github: 'kfcrobbie'},
         {name: 'Simon Legg', github: 'leggsimon'},
         {name: 'Massi Mura', github: 'MassimilianoMura'},
         {name: 'Mohamed Issaq', github: 'mohamedIssaq'},
         {name: 'Natalie Akam', github: 'natstar93'},
         {name: 'Salman Karim', github: 'salman-karim'},
         {name: 'Lucy Hargrave', github: 'Triffanys101'},
         {name: 'Zeina Dajani', github: 'zdajani'},
         {name: 'Michael Arnott', github: 'arnottmj'},
         {name: 'Lucy Oliphant', github: 'lroliphant'},
         {name: 'Theo Leanse', github: 'TheoLeanse'},
         {name: 'Ptolemy Barnes', github: 'ptolemybarnes'}
       ]

def add_user cohort, person
  params = {username: person[:name],
            email: person[:name].downcase.tr(' ', '_') + '@example.com',
            github: person[:github],
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
people.each { |person| add_user(june, person) }

all_ids = User.all.map { |user| user.id }
start = june.start_date
round_robin = pair_up(all_ids)

round_robin.each do |day|
  start += 2 if start.saturday?
  start += 1 if start.sunday?
  day.each do |pair|
    Pairing.create({day: start, user_id: pair[0], pair_id: pair[1]})
    Pairing.create({day: start, user_id: pair[1], pair_id: pair[0]})
  end
  start += 1
end
