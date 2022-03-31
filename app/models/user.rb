class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :reports, dependent: :destroy
  belongs_to :role, optional: true
  belongs_to :organisation, optional: true
  before_save :assign_role
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :reviews_cycles, dependent: :destroy

  def assign_role
    self.role = Role.find_by name: 'OrgMember' if role.nil?
  end

  def manager_assigned?
    manager_id.present?
  end

  def any_active_reviews_cycles?
    active_reviews_cycles.count >= 1
  end

  def reviews_cycles_list
    reviews_cycles.where.not(deadline: nil).where.not(review_request_date: nil)
  end

  def active_reviews_cycles
    reviews_cycles_list.where('deadline >= ?', Date.today)
  end
end
