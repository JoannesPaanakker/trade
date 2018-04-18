class BidsController < ApplicationController

  def new
    @bid = Bid.new
    @stockitem = Stockitem.find(params[:stockitem_id])
    if Bid.where(stockitem_id: @stockitem.id).first
      @highest_bid = Bid.where(stockitem_id: @stockitem.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse.first.bid_price
      @min_bid = @highest_bid + 5
    else
      @highest_bid = "no bid yet"
      @min_bid = 5
    end
    shoesize
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.stockitem_id = params[:stockitem_id]
    @bid.userbuy_id = current_user.id
    @stockitem = Stockitem.find(params[:stockitem_id])

    if Bid.where(stockitem_id: @stockitem.id).first
      @highest_bid = Bid.where(stockitem_id: @stockitem.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse.first.bid_price
      if @bid.bid_price > @highest_bid
        @bid.save!
        @stockitem = Stockitem.find(params[:stockitem_id])
        if @bid.bid_price == @stockitem.sell_price
          redirect_to new_order_path(@bid.id)
        else
          redirect_to stockitem_path(params[:stockitem_id])
        end
      else
        flash[:alert] = "Too late or too low: someone beat you to it!"
        redirect_to stockitem_path(params[:stockitem_id])
      end
    else
      @bid.save!
      @stockitem = Stockitem.find(params[:stockitem_id])
      if @bid.bid_price == @stockitem.sell_price
        redirect_to new_order_path(@bid.id)
      else
        redirect_to stockitem_path(params[:stockitem_id])
      end
    end
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
