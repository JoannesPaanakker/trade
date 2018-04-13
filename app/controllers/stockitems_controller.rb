class StockitemsController < ApplicationController
  def show
    @stockitem = Stockitem.find(params[:id])
    @bids = Bid.where(stockitem_id: @stockitem.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse

    @orders = Order.where(stockitem_id: @stockitem.id)
  end

  def index
    @stockitems = Stockitem.where(sold_status: false)
    @region = Region.find(2)[:name]
    @shoesizes = Shoesize.where(region_id: 2)[0][:sizes].split ","
  end

  def new
    @stockitem = Stockitem.new
    @users = User.all
  end

  def create
    @stockitem = Stockitem.new(stockitem_params)
    @stockitem.save!
    redirect_to stockitems_path
  end

  private
  def stockitem_params
    params.require(:stockitem).permit(:sell_price, :description, :original_code, :usersell_id, :stock_type)
  end

end
