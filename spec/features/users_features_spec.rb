require 'rails_helper'

feature "User" do

  let!(:user) { FactoryGirl.create(:user)}

  context "not logged in" do

    scenario "can log in" do
      visit "/"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to have_content "Signed in successfully."
    end

    scenario "cannot see a cohort" do
      visit "/"
      expect(page).not_to have_selector("input[type=submit][value='My Cohort']")
    end

  end

  context "logged in" do

    before { login_as(user, :scope => :user) }

    scenario "can sign out" do
      visit "/"
      expect(page).to have_selector("input[type=submit][value='Sign out']")
    end

    scenario "can see their cohort" do
      visit "/"
      expect(page).to have_selector("input[type=submit][value='My Cohort']")
    end

  end

end
