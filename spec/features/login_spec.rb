require 'rails_helper'

RSpec.feature 'login professor' do
  scenario "Allow a professor to login" do

    visit root_path

    user = FactoryGirl.create(:professor)
    fill_in 'user', with: user.email
    fill_in 'pass', with: user.password
    click_button 'login'
  end
end
