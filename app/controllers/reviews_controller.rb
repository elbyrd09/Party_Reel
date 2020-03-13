class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    # @review.user = current_user
    if @review.save
      redirect_to dashboard_path
    else
      render 'new'
    end
   end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
