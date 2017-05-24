require 'rails_helper'

RSpec.feature 'login user' do
  scenario "Allow a professor to login" do

    visit root_path

    user = FactoryGirl.build(:professor)
    fill_in 'professor_username', with: user.username
    fill_in 'professor_password', with: user.password
    click_button 'login'
  end

  scenario "Allow a administrator to login" do

    visit root_path

    page.check('loginCheckbox')
    user = FactoryGirl.build(:administrator)
    fill_in 'admin_username', with: user.username
    fill_in 'admin_password', with: user.password
    click_button 'login'
  end
end
