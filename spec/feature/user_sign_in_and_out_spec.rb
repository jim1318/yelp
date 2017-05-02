require 'spec_helper'

feature 'User signs in and out' do
  it "with valid inputs" do
    user = Fabricate(:user)
    visit sign_in_path
    sign_in(user)
    expect(current_path).to eq home_path
  end
end