class ReviewsCyclesController < ApplicationController
  before_action :set_reviews_cycle, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    redirect_to dashboard_url unless current_user.role.org_admin? || current_user.role.admin?
    @reviews_cycles = current_organisation.reviews_cycles.all
  end

  def show; end

  def new
    if org_has_active_reviews_cycles?
      redirect_to reviews_cycles_url,
                  notice: 'You already have a reviews cycle enabled. You can only have one reviews cycle enabled at a time :)'
    else
      @reviews_cycle = current_user.organisation.reviews_cycles.build
    end
  end

  def edit
    redirect_to dashboard_path, alert: 'You no longer can edit this review cycle' if @reviews_cycle.locked?
  end

  def create
    @reviews_cycle = current_user.organisation.reviews_cycles.build(reviews_cycle_params)

    respond_to do |format|
      if @reviews_cycle.save
        assign_users_to_review_cycle(@reviews_cycle)
        format.html { redirect_to reviews_cycle_url(@reviews_cycle), notice: 'Reviews cycle was successfully created.' }
        format.json { render :show, status: :created, location: @reviews_cycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reviews_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reviews_cycle.update(reviews_cycle_params)

        format.html do
          redirect_to reviews_cycle_url(@reviews_cycle), notice: 'Reviews cycle was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @reviews_cycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reviews_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reviews_cycle.destroy

    respond_to do |format|
      format.html { redirect_to reviews_cycles_url, notice: 'Reviews cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reviews_cycle
    @reviews_cycle = ReviewsCycle.find(params[:id])
  end

  def reviews_cycle_params
    params.require(:reviews_cycle).permit(:name, :organisation_id, :review_request_date, :deadline, :question_one,
                                          :question_two, :question_three, :question_four, :question_five,
                                          :question_six, :question_seven, :question_eight,
                                          :question_nine, :question_ten, selected_users: [])
  end

  def assign_users_to_review_cycle(cycle)
    user_ids = cycle.selected_users.reject(&:empty?)

    user_list = user_ids.map do |u|
      User.find_by(id: u.to_i)
    end

    cycle.users << user_list
  end

  def org_has_active_reviews_cycles?
    current_organisation.reviews_cycles&.any? { |cycle| cycle.enabled? }
  end
end
