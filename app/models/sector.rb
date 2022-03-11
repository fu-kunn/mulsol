class Sector < ApplicationRecord
  # belongs_to :customer, optional: true
  has_many :customers, dependent: :destroy
end
