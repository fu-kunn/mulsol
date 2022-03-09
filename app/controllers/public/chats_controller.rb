class Public::ChatsController < ApplicationController
  def index
    @my_chats=current_customer.chats
    @chat_partners=Customer.where.not(id:current_customer.id)#自分以外
  end

  def show
    @partner=Customer.find(params[:id])
    @chats_by_myself=Chat.where(customer_id: current_customer.id,partner_id: @partner.id)
    @chats_by_other=Chat.where(customer_id: @partner.id,partner_id: current_customer.id)
    @chats=@chats_by_myself.or(@chats_by_other)#リレーションオブジェクト達を結合する
    @chats=@chats.order(:created_at)
  end
end
