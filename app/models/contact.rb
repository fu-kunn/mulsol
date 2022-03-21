class Contact < ApplicationRecord
  belongs_to :customer
  has_many :notifications, dependent: :destroy
end