class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates_presence_of :review_text, :user_id, :business_id
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
end