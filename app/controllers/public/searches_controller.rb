class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]
    # @customers = Customer.looks(params[:search], params[:word])

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @issues = Issue.looks(params[:search], params[:word])
    end


  end
end
