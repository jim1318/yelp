require 'rails_helper'

describe Business do
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:address)}
  it {is_expected.to have_many(:reviews).order("created_at DESC")}

  describe "#average_rating" do
    it "returns the appropriate average" do
      business1 = Fabricate(:business)
      Fabricate(:review, rating: 1, business: business1, user_id: 1)
      Fabricate(:review, rating: 2, business: business1, user_id: 2)
      expect(business1.average_rating.round(1)).to eq(1.5)
    end
  end
end