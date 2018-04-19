class StockitemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @stockitem = Stockitem.find(params[:id])
    @bids = Bid.where(stockitem_id: @stockitem.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse
    @orders = Order.where(stockitem_id: @stockitem.id)
    shoesize
  end

  def index
    @stockitems = Stockitem.where(sold_status: false)
    shoesize
  end

  def new
    @stockitem = Stockitem.new
    @catalogitems = Catalogitem.all
    shoesize
  end

  def create
    @stockitem = Stockitem.new(stockitem_params)
    # @stockitem.catalogitem_id = params[:catalogitem_id]
    @stockitem.user = current_user
    @stockitem.internal_size = params[:internal_size]
    @stockitem.save!
    redirect_to stockitems_path
  end

  def edit
    @stockitem = Stockitem.find(params[:id])
  end

  def update
    # @stockitem = Stockitem.find(params[:id])
    # @stockitem.sold_status = true
    # @stockitem.update!(stockitem_params2)
    # redirect_to stockitems_path
  end

  def destroy
    @stockitem = Stockitem.find(params[:id])
    @stockitem.destroy
    redirect_to stockitems_path
  end

  private

  def stockitem_params
    params.require(:stockitem).permit(:sell_price, :usersell_id, :dead_stock, :internal_size, :catalogitem_id)
  end

  def stockitem_params2
    params.permit(:sell_price, :usersell_id, :dead_stock, :internal_size, :catalogitem_id)
  end

end
