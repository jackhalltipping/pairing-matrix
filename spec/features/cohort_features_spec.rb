require 'rails_helper'

feature "Viewing cohorts" do

  let!(:cohort_with_users) { create(:cohort_with_users) }
  let!(:user) { cohort_with_users.users.first }
  let!(:another_user) { cohort_with_users.users.last }
  before { login_as(user, :scope => :user) }

  scenario "when logged in a user can see a list of everyone in her cohort" do
    visit "/"
    click_button "My Cohort"
    expect(page).to have_content "#{another_user.username}"
    expect(page).to have_content "#{user.username}"
  end

end
