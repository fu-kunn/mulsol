class Public::SectorsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @sector = Sector.new(sector_params)
    @sector.customer_id = current_user.id
    if @sector.save
      redirect_to customer_path
    else
      redirect_to root_path
    end
  end

  def show
    @sector = Sector.find(params[:id])
    @sectors = Sector.order(created_at: :desc).limit(9).page(params[:page]).per(9)
  end

  def sector_params
    params.require(:sector).permit(:name, :sector_id)
  end
end
