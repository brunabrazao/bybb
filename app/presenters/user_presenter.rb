class UserPresenter < BasePresenter
  def initialize(current_user)
    @current_user = current_user
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

  def role_options
    if @current_user.role.admin?
      Role.all.map { |r| [r.name, r.id] }
    else
      Role.where.not(name: 'SuperAdmin').map { |r| [r.name, r.id] }
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
