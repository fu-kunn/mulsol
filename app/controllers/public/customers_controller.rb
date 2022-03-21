class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top]

  def top
  end

  def index
    @sectors = Sector.order(created_at: :desc)
    @customers = Customer.order(created_at: :desc).limit(9).page(params[:page]).per(9)
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    @issues = @customer.issues
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer!= current_customer
    redirect_to root_path
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(withdraw: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:company_name, :company_name_kana, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :tel, :withdraw, :email, :sector_id, :image)
  end

end