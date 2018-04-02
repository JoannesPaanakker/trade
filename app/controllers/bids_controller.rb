class BidsController < ApplicationController

  def new
    @bid = Bid.new
    @stockitem = Stockitem.find(params[:stockitem_id])
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.save!
    redirect_to stockitem_path(params[:stockitem_id])
  end

  private
  def bid_params
    params.require(:bid).permit(:bid_price, :stockitem_id, :userbuy_id)
  end
end
