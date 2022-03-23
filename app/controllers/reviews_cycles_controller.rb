class ReviewsCyclesController < ApplicationController
  before_action :set_reviews_cycle, only: %i[ show edit update destroy ]

  # GET /reviews_cycles or /reviews_cycles.json
  def index
    @reviews_cycles = ReviewsCycle.all
  end

  # GET /reviews_cycles/1 or /reviews_cycles/1.json
  def show
  end

  # GET /reviews_cycles/new
  def new
    @reviews_cycle = ReviewsCycle.new
  end

  # GET /reviews_cycles/1/edit
  def edit
  end

  # POST /reviews_cycles or /reviews_cycles.json
  def create
    @reviews_cycle = ReviewsCycle.new(reviews_cycle_params)

    respond_to do |format|
      if @reviews_cycle.save
        format.html { redirect_to reviews_cycle_url(@reviews_cycle), notice: "Reviews cycle was successfully created." }
        format.json { render :show, status: :created, location: @reviews_cycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reviews_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews_cycles/1 or /reviews_cycles/1.json
  def update
    respond_to do |format|
      if @reviews_cycle.update(reviews_cycle_params)
        format.html { redirect_to reviews_cycle_url(@reviews_cycle), notice: "Reviews cycle was successfully updated." }
        format.json { render :show, status: :ok, location: @reviews_cycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reviews_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews_cycles/1 or /reviews_cycles/1.json
  def destroy
    @reviews_cycle.destroy

    respond_to do |format|
      format.html { redirect_to reviews_cycles_url, notice: "Reviews cycle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviews_cycle
      @reviews_cycle = ReviewsCycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reviews_cycle_params
      params.require(:reviews_cycle).permit(:name, :organisation_id)
    end
end
