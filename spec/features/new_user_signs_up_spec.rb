require 'rails_helper'

feature "New user signs up" do
  scenario "successfully" do
    new_user = FactoryGirl.build(:user)
    visit root_path
    within(:css, ".sign_up_btn") { click_button('Sign Up') }
    save_and_open_page
  end
end