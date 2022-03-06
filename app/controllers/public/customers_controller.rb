class Public::CustomersController < ApplicationController
  def top
    @sectors = Sector.all
    @customers = Customer.all
  end

  # private

  # def customer_params
  #   params.require(:customer).permit(:company_name, :company_name_kana, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :tel, :withdraw, :email)
  # end
end
