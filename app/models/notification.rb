class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :chat, optional: true
  belongs_to :room, optional: true
  # 問い合わせメール送信時に管理者側に通知する
  # belongs_to :contact, optional: true
  belongs_to :relationship, optional: true

  belongs_to :visitor, class_name: "Customer", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "Customer", foreign_key: "visited_id", optional: true
end
