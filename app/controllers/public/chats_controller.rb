class Public::ChatsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    rooms = current_customer.customer_rooms.pluck(:room_id)
    customer_rooms = CustomerRoom.find_by(customer_id: @customer.id, room_id: rooms)

    if customer_rooms.nil?
      @room = Room.new
      @room.save!
      CustomerRoom.create!(customer_id: @customer.id, room_id: @room.id)
      CustomerRoom.create!(customer_id: current_customer.id, room_id: @room.id)
    else
      @room = customer_rooms.room
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    if CustomerRoom.where(customer_id: current_customer.id, room_id: params[:chat][:room_id]).present?
    @chat = current_customer.chats.new(chat_params)
    @room = @chat.room
    if @chat.save!

      @roommembernotme = CustomerRoom.where(room_id: @room.id).where.not(customer_id: current_customer.id)
      @theid = @roommembernotme.find_by(room_id: @room.id)
      notification = current_customer.active_notifications.new(
        room_id: @room.id,
        chat_id: @chat.id,
        visited_id: @theid.customer_id,
        visitor_id: current_customer.id,
        action: "chat"
        )

        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end