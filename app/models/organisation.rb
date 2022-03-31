class Organisation < ApplicationRecord
  has_many :users
  has_one :feed
  has_many :reviews_cycles

  before_save :assign_feed

  validates :title, presence: true
  validates :short_description, presence: true
  validates :licenses, presence: true

  def remaining_licenses_count
    if licenses.nil?
      0
    else
      licenses - users.count
    end
  end

  def has_remaining_licenses?
    remaining_licenses_count.positive?
  end

  def assign_feed
    self.feed = Feed.new(organisation_title: title, organisation_id: id) if feed.nil?
  end
end
