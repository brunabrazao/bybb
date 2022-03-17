class Role < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception

  def admin?
    name == 'SuperAdmin'
  end

  def org_admin?
    name == 'OrgAdmin'
  end

  def org_member?
    name == 'OrgMember'
  end

  def allow_to_invite_users?
    admin? || org_admin?
  end
end
