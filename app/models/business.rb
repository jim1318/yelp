class Business < ActiveRecord::Base
  has_many :reviews, -> { order "created_at DESC" }

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  def average_rating
    count = self.reviews.count
    if count > 0
      sum = self.reviews.inject(0) { |sum, n| sum + n.rating }
      sum.round(1) / count
    else
      0
    end
  end
end