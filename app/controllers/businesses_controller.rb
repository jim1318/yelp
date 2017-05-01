class BusinessesController < ApplicationController
  before_action :require_user, only: [:new, :create]


  def index
    @businesses = Business.all.sort_by { |business| business.average_rating }.reverse
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      flash[:success] = "Business Successfully Created!"
      render :show
    else
      flash[:danger] = "Problem with business inputs"
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address)
  end
end