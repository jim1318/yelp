require 'spec_helper'

feature 'User signs up' do
  scenario "with valid inputs" do
    visit register_path
    fill_in "user_email", with: "test_email@gmail.com"
    fill_in "user_password", with: "test_Password"
    fill_in "user_full_name", with: "Jim Finnigan"
    click_button "Sign Up"
    expect(current_path).to eq (sign_in_path)
  end
end

  