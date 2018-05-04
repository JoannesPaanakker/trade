class TransactionsController < ApplicationController
  def show
    @transaction = current_user.transactions.where(state: 'paid').find(params[:id])
    @order = Order.find(@transaction.order_id)
    @description = @order.stockitem.catalogitem.description
  end
end
