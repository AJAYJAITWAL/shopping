class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def payment
  end

  def place_order
    @new_order = Order.new(order_params)
    @order = current_user.latest_order
    @order_update = current_user.latest_order.update(total_price: @order.total_price, 
      status: 'payment', total_quantity: @order.total_quantity, payment_mode: @new_order.payment_mode)
    redirect_to orders_path
  end


  private
    def order_params
      params.require(:order).permit(:total_price, :total_quantity, :status, :payment_mode, :user_id)
    end
end
