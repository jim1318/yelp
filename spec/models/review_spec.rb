require 'rails_helper'

describe Review do
  it { is_expected.to validate_presence_of(:rating)}
  it { is_expected.to validate_presence_of(:review_text)}
  it { is_expected.to belong_to(:user)}
  it { is_expected.to belong_to(:business)}
  it do
    is_expected.to validate_numericality_of(:rating)
      .only_integer
      .is_greater_than_or_equal_to(1)
      .is_less_than_or_equal_to(5)
  end
end