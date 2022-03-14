class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :reports
  belongs_to :role, optional: true
  belongs_to :organisation, optional: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'OrgMember' if role.nil?
  end

  def manager_assigned?
    manager_id.present?
  end
end
