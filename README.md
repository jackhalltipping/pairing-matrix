# pairing-matrix

## Getting Started

The database is seeded with my Makers cohort. Pairs are created using the Round Robin algorithm. To log in your email address is ``<first_name_lower_case>_<last_name_lowercase>@example.com` and the password is `password`

```bash
git clone https://github.com/jackhalltipping/pairing-matrix.git
cd pairing-matrix
bundle install
npm install
bower install
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
rails s
```

Go to http://localhost:3000

## Running Tests

```bash
rspec
```

## Kanban

Waffle Board: https://waffle.io/jackhalltipping/pairing-matrix

## Heroku

https://dj-jankc.herokuapp.com

## Higgs bosons
* In order to push to heroku, I had to run `rake assets:precompile` from the terminal. That let the rails pipeline know about angular and some other dependencies. The specific error that heroku threw when I tried to push the first time was `deploying to heroku asset pipeline Sprockets::fileNotFound`. Googled that and found this page `http://stackoverflow.com/questions/13077564/deploying-to-heroku-asset-pipeline-sprocketsfilenotfound`. `rake assetes:precompile` added some files to `public/assets`.
* In order to get bower to work with Rails (to configure angular), we had to follow this guide: http://dotwell.io/taking-advantage-of-bower-in-your-rails-4-app/


##Plan:
* 9:30 and 1:30 standups
* Alternating Frontend/Backend pairs, alternating for each ticket
* MVP


#User-stories:
```
As a maker
I want to be paired with someone
So that I can learn faster

As a bewildered maker
I want to see a list of everyone in my cohort
So that I know who these weird people are

As a promiscuous maker
I want to see a sorted list of people in my cohort that I have/have not paired with
So that I can keep pairing with more people

As a shy maker  
I want a pair partner to be randomly assigned to me  
So that I don’t have to ask them  

As an unfriendly maker  
I want to have a blacklist of students I will never be paired with  
So that I never have to listen to them speak  
```

# Technologies used:
### Backend:
* Ruby (Rails)

### Frontend:
* Angular
* HTML 5
* Bootstrap
* CSS 3

### Testing:
* Rspec
* FactoryGirl
* Protractor
