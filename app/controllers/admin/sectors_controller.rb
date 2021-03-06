class Admin::SectorsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sector = Sector.new
    @sectors = Sector.all
  end

  def create
    @sector = Sector.new(sector_params)
    @sector.save!
    redirect_to request.referer
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def update
    @sector = Sector.find(params[:id])
    @sector.update(sector_params)
    redirect_to admin_sectors_path
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    redirect_to admin_sectors_path
  end


  private
  def sector_params
    params.require(:sector).permit(:name)
  end
end