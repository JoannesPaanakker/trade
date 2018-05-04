class OrdersController < ApplicationController
  def new
    @order = Order.new
    @bid = Bid.find(params[:format])
    @stockitem = Stockitem.find(@bid.stockitem_id)
  end

  def create
    @bid=Bid.find(params[:bid_id])
    @order = Order.new(order_params)
    @order.stockitem_id = params[:stockitem_id]
    @order.bid_id = params[:bid_id]
    @order.order_price = @bid.bid_price
    @order.order_time = Time.new
    @order.order_nr = Order.last.order_nr + 1
    @orderstatus = Orderstatus.where(code: 101)
    @order.orderstatus_id = @orderstatus[0].id
    @order.save!
    # Update stockitem status:
    @stockitem = Stockitem.find(params[:stockitem_id])
    @stockitem.sold_status = true
    @stockitem.update!(stockitem_params2)
    # Create payment transaction:
    @order = Order.last
    transaction = Transaction.create!(transaction_order_nr: @order.order_nr, amount: @order.order_price, state: 'pending', user: current_user, order: @order)
    redirect_to new_transaction_payment_path(transaction)
  end

  def show
    @order = Order.find(params[:id])
    @stockitem = Stockitem.find(@order.stockitem_id)
    @selling_user = User.find(@stockitem.usersell_id)
    @bid = Bid.find(@order.bid_id)
    @buying_user = User.find(@bid.userbuy_id)
    shoesize
  end

  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:order_id])
    @stockitem = Stockitem.find(@order.stockitem_id)
    @bid = Bid.find(@order.bid_id)
    shoesize
  end

  def update
    @order = Order.find(params[:order_id])
  end

  private

  def order_params
    params.permit(:stockitem_id, :bid_id, :order_price, :order_time, :orderstatus_id, :order_nr)
  end

  def stockitem_params2
    params.permit(:sell_price, :usersell_id, :dead_stock, :internal_size, :catalogitem_id, :sold_status)
  end
end
