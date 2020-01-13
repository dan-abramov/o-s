class OrdersController < ApplicationController

  def create
    @order = Order.create(order_params)
    if @order.save
      flash[:notice] = 'Заказ создан'
    else
      flash[:notice] = 'Заказ не был создан. Попробуйте еще раз.'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy!
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
