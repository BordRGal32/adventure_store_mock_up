class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @adventure = Adventure.find(params[:adventure_id])
  end
  def create
    @review = Review.new(review_params)
    @user = current_user
    @adventure = Adventure.find(params[:adventure_id])
    if @review.save
      @user.reviews << @review
      @adventure.reviews << @review
      respond_to do |format|
        format.html { redirect_to adventure_path(@adventure) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to adventure_path(@adventure)}
        format.js { render 'new' }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
