class DashboardsPresenter < BasePresenter
  def super_admin_items
    [
      OpenStruct.new(title: 'Organisations', description: 'Manage all organisations', link: organisations_path),
      OpenStruct.new(title: 'Roles', description: 'Manage all roles', link: roles_path),
      OpenStruct.new(title: 'Users', description: 'Manage all users', link: users_path),
      OpenStruct.new(title: 'Manage reports', description: 'Manage all reports', link: reports_path),
      OpenStruct.new(title: 'Manage reviews', description: 'Manage all reviews', link: reviews_path),
      OpenStruct.new(title: 'Review Cycles', description: 'Manage review cycles',
                     link: reviews_cycles_path)

    ]
  end

  def org_member_items
    [
      OpenStruct.new(title: 'Create a report', description: 'Create a report', link: new_report_path),
      OpenStruct.new(title: 'Manage reports', description: 'Manage all reports', link: reports_path),
      OpenStruct.new(title: 'Manage reviews', description: 'Manage your reviews', link: reviews_path)
    ]
  end

  def org_admin_items
    [
      OpenStruct.new(title: 'My organisation', description: 'View and manage your organisation',
                     link: organisations_path),
      OpenStruct.new(title: 'Manage reports', description: 'Manage your reports', link: reports_path),
      OpenStruct.new(title: 'Users', description: 'Manage users in your organisation', link: users_path),
      OpenStruct.new(title: 'Review Cycles', description: 'Manage review cycles in your organisation',
                     link: reviews_cycles_path),
      OpenStruct.new(title: 'Manage reviews', description: 'Manage your reviews',
                     link: reviews_path)
    ]
  end

  def any_report_this_week?(reports)
    reports.any?(&submitted_this_week?)
  end
end
