class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feed, only: :show

  load_and_authorize_resource

  def index
    redirect_to dashboard_url unless current_user.role.admin?

    @feeds = Feed.all
  end

  def show; end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
