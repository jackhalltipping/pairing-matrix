require 'rails_helper'

feature "User" do

  let!(:user) { create(:user)}

  context "not logged in" do

    before do
      visit "/"
      create_pairing_for_the_week(user)
    end

    scenario "can log in" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to have_content "Signed in successfully."
    end

    scenario "cannot see a cohort" do
      expect(page).not_to have_selector("input[type=submit][value='My Cohort']")
    end

  end

  context "logged in" do

    before do
      create_pairing_for_the_week(user)
      login_as(user, :scope => :user)
      visit "/"
    end

    scenario "can sign out" do
      expect(page).to have_selector("input[type=submit][value='Sign out']")
    end

    scenario "can see their cohort" do
      expect(page).to have_selector("input[type=submit][value='My Cohort']")
    end

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
