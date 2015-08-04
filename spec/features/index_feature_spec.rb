require 'rails_helper'

feature 'Index' do

  let!(:user) { FactoryGirl.create(:user)}

  context 'user is not logged in' do
    scenario 'user cannot see pairing buttons' do
      visit '/'
      expect(page).not_to have_content('today?')
      expect(page).not_to have_content('tomorrow?')
      expect(page).not_to have_content('this week?')
    end
  end

  context 'user is logged in' do
    scenario 'user can see pairing buttons' do
      visit '/'
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to have_content('today?')
      expect(page).to have_content('tomorrow?')
      expect(page).to have_content('this week?')
    end
  end

end