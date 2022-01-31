class Api::OrdersController <  Api::BaseController
  include JsonApiParamsAdapter

  def index

  end

  def show

  end

  def create
    order = Order.new(order_params)
    if order.save
      render_jsonapi_response(OrderSerializer.new(order))
    else
      render_jsonapi_response(order.errors)
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_order
  end

  def set_orders
  end

  def order_params
    params.require(:order).permit(
      :description, :status, :total_orders, :total_value)
  end
end
