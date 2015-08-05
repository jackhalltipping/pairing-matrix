FactoryGirl.define do

  sequence :name do |n|
    "new_cohort_#{n}"
  end

  factory :cohort do
    name { generate(:name) }
    start_date Date.new(2000,1,1)
  end

  factory :cohort_with_users, parent: :cohort do
    after(:create) do |cohort|
      cohort.users << FactoryGirl.create(:user)
      cohort.users << FactoryGirl.create(:user)
    end
  end

end
