require 'rails_helper'

feature "Viewing cohorts" do

  let!(:user) { FactoryGirl.create(:user, cohort: "june2015")}
  let!(:another_user) { FactoryGirl.create(:user, cohort: "june2015")}
  before { login_as(user, :scope => :user) }

  scenario "when logged in a user can see a list of everyone in her cohort" do
    visit "/"
    click_button "My Cohort"
    expect(page).to have_content "#{another_user.username}"
    expect(page).to have_content "#{user.username}"
  end

end
