class Public::SectorsController < ApplicationController
  def new
    @sector = Sector.new
    @customer = current_customer
  end

  def create
    @sector = Sector.new(sector_params)
    # @sector.name = ????
    if @sector.save
      redirect_to customer_path, notice: "You have created successfully."
    else
      redirect_to root_path
    end
  end


  def show
    @sector = Sector.find(params[:id])
  end

  # def edit
  #   @sector = Sector.find(params[:id])
  # end

  # def update
  #   @sector = Sector.find(params[:id])
  #   if @sector.update(sector_params)
  #     redirect_to mypage_customers_path
  #   else
  #     render :edit
  #   end
  # end


  def sector_params
    params.require(:sector).permit(:name, :sector_id)
  end
end
