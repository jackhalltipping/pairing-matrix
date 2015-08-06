require 'rails_helper'

feature 'Pairing' do

  let!(:user) { create(:user)}

  context 'user is not logged in' do
    scenario 'user cannot see pairing buttons' do
      visit '/'
      expect(page).not_to have_content('See my pairs')
    end
  end

  context 'user is logged in' do
    scenario 'user can see pairing buttons' do
      login_as(user, :scope => :user)
      visit '/'
      expect(page).to have_content('See my pairs')
    end
  end

end
