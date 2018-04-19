class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bids = Bid.where(userbuy_id: @user)
    @stockitems = Stockitem.where(usersell_id: @user)
    if @bids
      @nrbids = @bids.count
    else
      @nrbids = 0
    end
    if @stockitems
      @nrstockitems = @stockitems.count
    else
      @nrstockitems = 0
    end
    if @user.region
      @region = @user.region.name
    else
      @region = "EU"
    end
    # if @orders
    #   @nrorders = @orders.count
    # else
    #   @nrorders = 0
    # end
  end

  def index
    @users = User.all
    @bids = Bid.all
    @stockitems = Stockitem.all
    @orders = Order.all
    if @bids
      @nrbids = @bids.count
    else
      @nrbids = 0
    end
    if @stockitems
      @nrstockitems = @stockitems.count
    else
      @nrstockitems = 0
    end
    if @orders
      @nrorders = @orders.count
    else
      @nrorders = 0
    end
  end
end
