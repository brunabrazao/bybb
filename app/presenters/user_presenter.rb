class UserPresenter < BasePresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def user_manager_email
    find_user_id = User.find_by(manager_id: @current_user.manager_id).manager_id
    User.find_by(id: find_user_id).email
  end

  def reviews_for_current_user_as_manager
    Review.where(user: User.where(manager_id: @current_user.id))
  end

  def reports_for_current_user_as_manager
    Report.where(user: User.where(manager_id: @current_user.id))
  end
end
