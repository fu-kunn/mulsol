class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]
    @customers = Customer.looks(params[:search], params[:word]).order(created_at: :desc).limit(9).page(params[:page]).per(9)
    @issues = Issue.looks(params[:search], params[:word]).page(params[:page]).per(9)

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word]).order(created_at: :desc).limit(9).page(params[:page]).per(9)
    elsif @range == "ニーズ"
      @issues = Issue.looks(params[:search], params[:word]).page(params[:page]).per(9)
    else
      @issues = Issue.looks(params[:search], params[:word]).page(params[:page]).per(9)
    end


  end
end
