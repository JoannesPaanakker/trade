class BidsController < ApplicationController

  def new
    @bid = Bid.new
    @stockitem = Stockitem.find(params[:stockitem_id])
    shoesize
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.stockitem_id = params[:stockitem_id]
    @bid.userbuy_id = current_user.id
    @bid.save!
    redirect_to stockitem_path(params[:stockitem_id])
  end

  def destroy
    @bid = Bid.find(params[:id])
    @id = @bid.stockitem_id
    @bid.destroy
    redirect_to stockitem_path(@id)
  end

  private
  def bid_params
    params.require(:bid).permit(:bid_price, :stockitem_id, :userbuy_id)
  end
end
