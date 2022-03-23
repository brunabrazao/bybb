class ReviewsCyclesController < ApplicationController
  before_action :set_reviews_cycle, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @reviews_cycles = ReviewsCycle.all
  end

  def show; end

  def new
    @reviews_cycle = current_user.organisation.reviews_cycles.build
  end

  def edit; end

  def create
    @reviews_cycle = current_user.organisation.reviews_cycles.build(reviews_cycle_params)

    respond_to do |format|
      if @reviews_cycle.save
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
    params.require(:reviews_cycle).permit(:name, :organisation_id)
  end
end
