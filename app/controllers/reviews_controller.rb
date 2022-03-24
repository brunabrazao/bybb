class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = current_user.reviews.all
  end

  def show; end

  def new
    @review = current_user.reviews.build
  end

  def edit; end

  def create
    @review = current_user.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:answer_one, :answer_two, :answer_three, :answer_four, :answer_five,
                                   :answer_six, :answer_seven, :answer_eight, :answer_nine, :answer_ten,
                                   :reviews_cycle_id)
  end
end
