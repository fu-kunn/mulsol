class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.order(created_at: :desc).limit(10).page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
