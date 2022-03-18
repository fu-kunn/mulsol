class Public::SectorsController < ApplicationController
  def new
    @sector = Sector.new
    @customer = current_customer
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      redirect_to customer_path, notice: "You have created successfully."
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
