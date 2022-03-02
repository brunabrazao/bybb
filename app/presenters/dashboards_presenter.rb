class DashboardsPresenter < BasePresenter
  def super_admin_items
    [
      OpenStruct.new(title: 'Organisations', description: 'Manage all organisations', link: organisations_path),
      OpenStruct.new(title: 'Roles', description: 'Manage all roles', link: roles_path),
      OpenStruct.new(title: 'Users', description: 'Manage all users', link: users_path),
    ]
  end
end
