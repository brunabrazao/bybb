class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    render_reports
  end

  def show; end

  def new
    ensure_that_user_has_line_manager_assigned

    if user_already_submitted_report
      redirect_to reports_url, notice: 'You already submitted a report this week :)'
    else
      @report = current_user.reports.build
    end
  end

  def edit; end

  def create
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:weekly_priority, :biggest_challenge, :additional)
  end

  def render_reports
    @reports = if current_user.role.admin?
                 Report.all
               else
                 current_user.reports.all
               end
  end

  def user_already_submitted_report
    current_user_reports = current_user.reports

    current_user_reports.any? && current_user_reports.last.submitted_this_week?
  end

  def ensure_that_user_has_line_manager_assigned
    redirect_to root_url unless current_user.manager_id.present?
  end
end
