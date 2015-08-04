require 'rails_helper'

describe 'Pairs' do

  let!(:user) { FactoryGirl.create(:user) }

  context 'when logged in' do

    scenario 'shows user their username' do
      login_as user
      visit '/pairs/show'
      expect(page).to have_content(user.username)

    end
  end

end