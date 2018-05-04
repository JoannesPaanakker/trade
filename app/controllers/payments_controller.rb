class PaymentsController < ApplicationController
  before_action :set_transaction

  def new
    @order = Order.find(@transaction.order_id)
    @description = @order.stockitem.catalogitem.description
  end

  def create
    # check User for stripe customer id?
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      # Update User with stripe customer id
      amount:       @transaction.amount_cents,
      description:  "Payment for StarTrade Order #{@transaction.transaction_order_nr} for transaction #{@transaction.id}",
      currency:     @transaction.amount.currency
    )

    @transaction.update(payment: charge.to_json, state: 'paid')
    redirect_to transaction_path(@transaction)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_transaction_payment_path(@transaction)
  end

  private

  def set_transaction
    @transaction = current_user.transactions.where(state: 'pending').find(params[:transaction_id])
  end

end
