class Api::OrdersController <  Api::BaseController
  include JsonApiParamsAdapter

  def index
    render_jsonapi_response(OrderSerializer.new(@orders))
  end

  def show

  end

  def create
    order = Order.new(order_params)
    order.client_id = current_user.client.id

    if order.save()
      render_jsonapi_response(OrderSerializer.new(order))
    else
      render_jsonapi_response(order.errors, status: 404)
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
    @orders = Orders.all
  end

  def order_params
    params.require(:data).permit(
      :description,
      :recipient_name,
      :paid_aout,
      :value,
      :collect_id,
      address_attributes: [
        :description,
        :number,
        :reference,
        :street,
        :city,
        :cep,
        :district
      ]
    )
  end
end
