require 'rails_helper'

feature "Viewing cohorts" do

  let!(:cohort_with_users) { create(:cohort_with_users) }
  let!(:user) { cohort_with_users.users.first }
  let!(:another_user) { cohort_with_users.users.last }
  before do
    create_pairing_for_the_week(user)
    login_as(user, :scope => :user)
  end

  scenario "when logged in a user can see a list of everyone in her cohort" do
    visit "/"
    click_button "My Cohort"
    expect(page).to have_content "#{another_user.username}"
    expect(page).to have_content "#{user.username}"
  end

  def create_pairing_for_the_week user
    today = Date.today
    days_of_the_week = (today.at_beginning_of_week..today.at_end_of_week).to_a[0..4]
    days_of_the_week.each do |day|
      another_user = create(:user)
      Pairing.create(day: day, user_id: user.id, pair_id: another_user.id)
    end
  end

end
