require 'spec_helper'

feature 'User signs in and adds new business' do
  scenario "with everything valid" do 
    visit sign_in_path
    sign_in
    expect(current_path).to eq home_path

    visit new_business_path
    fill_in "business_name", with: "Bob's Burgers"
    fill_in "business_address", with: "123 Main St."
    click_button "Add Business"

    expect(page).to have_content "Bob's Burgers"
  end
end
