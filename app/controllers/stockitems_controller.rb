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
    @stockitems_highestbids = []
    @stockitems.each do |s|
      @highest_bid = Bid.where(stockitem_id: s.id).sort { |a,b| a.bid_price <=> b.bid_price }.reverse.first
      if @highest_bid
        @highest_bid_price = @highest_bid.bid_price
      else
        @highest_bid_price = 0
      end
      @stockitems_highestbids << @highest_bid_price
    end
    shoesize
  end

  def new
    @stockitem = Stockitem.new
    @catalogitem = Catalogitem.find(params[:format])
    shoesize
  end

  def create
    @stockitem = Stockitem.new(stockitem_params)
    @stockitem.catalogitem_id = params[:catalogitem_id]
    @stockitem.user = current_user
    @stockitem.internal_size = params[:internal_size]
    if @stockitem.internal_size == 0
      flash[:alert] = "Please select a shoesize"
      redirect_to new_stockitem_path(@stockitem.catalogitem_id)
    else
      @stockitem.save!
      redirect_to stockitems_path
    end
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
