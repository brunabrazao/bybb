class Organisation < ApplicationRecord
  has_many :users

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
end
