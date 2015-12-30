require 'rails_helper'

RSpec.describe "Authentications", type: :feature do
  it "doesn't allow blank in the email field" do 
    visit root_path
    expect(page).to have_content "Log in"
    expect(page).to have_unchecked_field "Remember me"
    fill_in :email, with: ""
    click_button "Log in"
    expect(current_path).to eq "/users/sign_in" 
  end 

  it "allows first users to sign up" do 
    visit root_path
    click_link "Sign up"
    expect(current_path).to eq "/users/sign_up"
  end 

  it "requires fill in name, email and password and password confirmation" do
    visit "/users/sign_up"
    user = FactoryGirl.build(:user)
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation
    click_button "Sign up"
    expect(page).to have_content user.name
    expect(page).to have_link "Sign out"
  end
end
