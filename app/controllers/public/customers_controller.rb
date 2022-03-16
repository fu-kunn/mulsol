class Public::CustomersController < ApplicationController
  def top
  end

  def index
    @sectors = Sector.all
    @customers = Customer.order(created_at: :desc).limit(4).page(params[:page]).per(4)
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    @issues = @customer.issues
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
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