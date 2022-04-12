class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @reviews = current_user.reviews.all
  end

  def show
    redirect_to root_url unless has_permission_to_view_reviews?
  end

  def new
    ensure_review_cycle_is_available

    if user_already_submitted_review?
      redirect_to reviews_url, notice: 'You already submitted a review for lastest review cycle :)'
    else
      @review = current_user.reviews.build
    end
  end

  def edit
    redirect_to reviews_path unless @review.reviews_cycle.deadline < Date.current
  end

  def create
    ensure_review_cycle_is_available

    @review = current_user.reviews.build(review_params)
    @review.reviews_cycle_id = most_recent_review_cycle.id

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
    return unless @review.reviews_cycle.deadline < Date.current

    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_already_submitted_review?
    return unless current_user.any_active_reviews_cycles?

    user_review_cycle = current_user.reviews.last
    active_review_cycle = current_user.active_reviews_cycles.last

    user_review_cycle&.reviews_cycle_id == active_review_cycle.id
  end

  helper_method :most_recent_review_cycle

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:answer_one, :answer_two, :answer_three, :answer_four, :answer_five,
                                   :answer_six, :answer_seven, :answer_eight, :answer_nine, :answer_ten)
  end

  def most_recent_review_cycle
    current_user.active_reviews_cycles.last
  end

  def ensure_review_cycle_is_available
    unless current_user.any_active_reviews_cycles?
      redirect_to dashboard_path,
                  alert: 'There is no reviews cycle available'
    end
  end

  def has_permission_to_view_reviews?
    @review.user == current_user || @review.user.manager_id == current_user.id
  end
end
