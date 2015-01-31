require 'rails_helper'

feature 'User signs in' do
  background do
    @user = create(:user)
  end

  scenario "with existing username" do 
    visit root_path
    click_link "Sign In"
    within(:css , "#login") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "Log in"
    end
    expect(page).to have_content "Start CLT"
    expect(page).to have_content "Get Together"
    expect(page).to have_content "Signed in successfully."
  end


# describe "Logging in", :type => :feature do
  
  # let(:user){ create(:user) }

  # it "signs me in" do
  #   visit new_user_session_path
  #   within("#new_user") do
  #     fill_in 'Email', :with => user.email
  #     fill_in 'Password', :with => '12345678'
  #     click_button 'Log in'
  #   end
  #   #save_and_open_page

  #   expect(page).to have_content 'Signed in successfully.'
  # end

#   let(:user){ create(:user) }

#   it "signs me in" do
#     visit new_user_session_path
#     within("#new_user") do
#       fill_in 'Email', :with => user.email
#       fill_in 'Password', :with => '12345678'
#       click_button 'Log in'
#     end
#     #save_and_open_page

#     expect(page).to have_content 'Signed in successfully.'
#   end
  
  # it "shows me my email in the navigation" do
  #   visit new_user_session_path
  #   within("#new_user") do
  #     fill_in 'Email', :with => user.email
  #     fill_in 'Password', :with => '12345678'
  #     click_button 'Log in'
  #   end
  #   #save_and_open_page

  #   expect(page).to have_content user.email
  # end
  
  # pending "shows me my email in the navigation when I use the slick as_user trick" do
  #   as_user(user) do
  #     expect(page).to have_content user.email
  #   end
  # end
end