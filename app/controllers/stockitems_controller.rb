class StockitemsController < ApplicationController
  def show
    @stockitem = Stockitem.find(params[:id])
    @bids = Bid.where(stockitem_id: @stockitem.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse

    @orders = Order.where(stockitem_id: @stockitem.id)
  end
  
  def index
    @stockitems = Stockitem.where(sold_status: false)
  end

  def new
    @stockitem = Stockitem.new
  end
end
