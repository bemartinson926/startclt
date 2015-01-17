require 'rails_helper'

describe "New user signs up", :type => :feature do

  scenario "successfully" do

    new_user = FactoryGirl.build(:user)
    visit root_path
    within(:css, ".panel") { click_link('Sign Up Now') }
    within(:css, ".new_user") do
      fill_in('Email', with: new_user.email)
      fill_in('Password', with: new_user.password)
      fill_in('Password confirmation', with: new_user.password)
      click_button('Sign up')
    end

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
