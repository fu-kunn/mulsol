class Sector < ApplicationRecord
  belongs_to :customer, optional: true
end
