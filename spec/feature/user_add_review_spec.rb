require 'spec_helper'

feature 'User signs in and adds new revew' do
  scenario "with everything valid" do 
    business = Fabricate(:business)

    visit sign_in_path
    sign_in
    
    find("a[href='/businesses/#{business.id}']").click
    click_link "Add New Review"

    find('#review_rating').find(:xpath, 'option[1]').select_option
    fill_in "review_review_text", with: "This is the review Text"
    click_button "Submit New Review"

    expect(page).to have_content "This is the review Text"
  end
end
