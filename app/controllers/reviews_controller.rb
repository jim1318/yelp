class ReviewsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @reviews = Review.all.sort_by{ |review| review.created_at }.reverse.first(5)
  end

  def new
    @business = Business.find(params[:business_id])
    @review = Review.new
  end

  def create
    @business = Business.find(params[:business_id])
    review = @business.reviews.build(review_params.merge!(user: current_user))
    if review.save
      redirect_to @business
    else
      flash.now[:danger] = "Invaid review"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review_text)
  end
end
