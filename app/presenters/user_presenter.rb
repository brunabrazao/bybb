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

  def organisation_options
    Organisation.all.map do |org|
      [org.title, org.id]
    end
  end

  def user_options
    if @current_user.organisation.users.length <= 1 && @current_user.manager_id.nil?
      ['No users in this organisation']
    else
      User.all.where(organisation: @current_user.organisation).map do |user|
        [user.email, user.id]
      end
    end
  end
end
