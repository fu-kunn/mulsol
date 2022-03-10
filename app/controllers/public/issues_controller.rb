class Public::IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @customer = current_customer
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.customer_id = current_customer.id
    @customer = current_customer
    if @issue.save
      redirect_to customer_path(@customer), notice: "You have created book successfully."
    else
      redirect_to root_path
    end
  end

  def edit
    @issue = Issue.find(params[:id])
    # ログインしているユーザーのみ削除
    @customer = @issue.customer_id
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    @customer = current_customer
    redirect_to customer_path(@customer)
  end

  def issue_params
    params.require(:issue).permit(:needs, :challenge)
  end
end
