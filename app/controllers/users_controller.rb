class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bids = Bid.where(userbuy_id: @user)
    @stockitems = Stockitem.where(usersell_id: @user)
    @nrbids = @bids.count
    getBuyOrders(@bids)
    @nrstockitems = @stockitems.count
    getSellOrders(@stockitems)
    if @user.region
      @region = @user.region.name
    else
      @region = "EU"
    end
  end

  def index
    @users = User.all
  end

  def getBuyOrders(bids)
    @buy_orders = []
    bids.each do |b|
      @buy_order = Order.where(bid_id: b)
      if @buy_order.any?
        @buy_orders << @buy_order
      end
    end
    return @buy_orders
  end

  def getSellOrders(stockitems)
    @sell_orders = []
    stockitems.each do |s|
      @sell_order = Order.where(stockitem_id: s)
      if @sell_order.any?
        @sell_orders << @sell_order
      end
    end
    return @sell_orders
  end

end
