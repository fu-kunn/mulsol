class Contact < ApplicationRecord
  # belongs_to :customer
  # has_many :notifications, dependent: :destroy
  validates :company_name, presence: true
  validates :email, presence: true
  validates :subject, presence: true, length: { maximum: 40 }
  validates :message, presence: true, length: { maximum: 500 }
end