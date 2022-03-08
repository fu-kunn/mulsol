class Public::IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @customer = current_customer
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.customer_id = current_customer.id
    if @issue.save
      redirect_to mypage_customers_path, notice: "You have created book successfully."
    else
      redirect_to root_path
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to mypage_customers_path
    else
      render :edit
    end
  end

  def issue_params
    params.require(:issue).permit(:needs, :challenge)
  end
end
