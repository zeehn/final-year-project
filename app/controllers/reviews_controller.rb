class ReviewsController < ApplicationController 
  def new
    @maid = Maid.find(params[:maid_id])
    @review = current_user.reviews.new
  end

  def create
    @maid = Maid.find(params[:maid_id])
    @review = current_user.reviews.new(review_params)
    @review.maid = @maid
 
    if @review.save
      redirect_to orders_path, notice: "Thanks for the feedback!" 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private 
    def set_maid 
      @maid = Maid.find(params[:maid_id])
    end

    def review_params
      params.require(:review).permit(:stars, :comment)
    end
end
