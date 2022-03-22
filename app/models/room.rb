class Room < ApplicationRecord
  has_many :chats
  has_many :customer_rooms  #1つのルームにいるユーザ数は2人のためhas_manyになる
  has_many :notifications, dependent: :destroy
end
