class CatalogitemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @catalogitems = Catalogitem.all
  end

  def show
    @catalogitem = Catalogitem.find(params[:id])
  end

  def new
    @catalogitem = Catalogitem.new
  end

  def create
    @catalogitem = Catalogitem.new(catalogitem_params)
    @catalogitem.save!
    redirect_to catalogitems_path
  end

  def edit
    @catalogitem = Catalogitem.find(params[:id])
  end

  def update
    @catalogitem = Catalogitem.find(params[:id])
    @catalogitem.update!(catalogitem_params)
    redirect_to catalogitems_path
  end

  private

  def catalogitem_params
    params.require(:catalogitem).permit(:release_date, :colour, :retail_price, :photo, :brand, :description, :product_code, :category)
  end
end
