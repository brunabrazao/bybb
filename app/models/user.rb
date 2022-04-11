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
    active_reviews_cycles.count >= 1 && active_reviews_cycles.last.enabled?
  end

  def reviews_cycles_list
    reviews_cycles.where.not(deadline: nil).where.not(review_request_date: nil)
  end

  def active_reviews_cycles
    reviews_cycles_list.where('deadline >= ?', Date.today)
  end

  def active_reviews_cycle_id
    active_reviews_cycles.last.id
  end

  def manager_email(line_manager_id)
    return nil unless line_manager_id

    User.find_by(id: line_manager_id).email
  end

  def review_submitted_for_latest_reviews_cycle?(review_cycle_id)
    reviews.any? && reviews.last.reviews_cycle_id == review_cycle_id
  end
end
