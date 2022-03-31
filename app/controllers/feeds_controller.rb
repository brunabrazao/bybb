class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feed, only: :show

  load_and_authorize_resource

  def index
    redirect_to dashboard_url unless current_user.role.admin?

    @feeds = Feed.all
  end

  def show; end

  def destroy
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
    end
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
