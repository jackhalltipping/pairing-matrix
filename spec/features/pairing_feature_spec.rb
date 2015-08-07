require 'rails_helper'

feature 'Pairing' do

  let!(:user) { create(:user)}

  context 'user is not logged in' do
    scenario 'user cannot see pairing buttons' do
      visit '/'
      expect(current_url).not_to have_content('/pairs/show')
    end
  end

  context 'user is logged in' do

    before do
      today = Date.today
      days_of_the_week = (today.at_beginning_of_week..today.at_end_of_week).to_a[0..4]
      days_of_the_week.each do |day|
        another_user = create(:user)
        Pairing.create(day: day, user_id: user.id, pair_id: another_user.id)
      end
    end

    scenario 'user can see pairing buttons' do
      login_as(user, :scope => :user)
      visit '/'
      expect(current_url).to have_content('/pairs/show')
    end
  end

end
