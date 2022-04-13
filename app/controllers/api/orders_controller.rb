require 'twilio-ruby'
class Api::OrdersController <  Api::BaseController
  include JsonApiParamsAdapter

  before_action :set_order, only: [:show, :update, :destroy]
  before_action :set_orders, only: [:index, :request_withdrawal]

  def index
    render_jsonapi_response(OrderSerializer.new(@orders))
  end

  def show
    render_jsonapi_response(OrderSerializer.new(@order))
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

  #POST solicitar retidada de pedido(s) 
  def request_withdrawal
    # deve gerar pedido de coleta
    # atualizar campos da coleta como contagem e status
    # pedido deve estar com status diferente sinalizando que está em preocess ode entrega
    # notificar os entregadores
       
    payload_params = []
    params[:data][:delivery_men][:id].each do |id|
      payload_params << { collect_id: order_params[:collect_id], deliveryman_id: id }
    end
    
    if @orders.update_all(collect_id: order_params[:collect_id])
      collect_deliverymen = CollectDeliveryman.create(payload_params)
      # TODO: pode ser criado um observer para isso no after_create
      debugger 
      collect_deliverymen.each do |collect_d|
        NotifyCollectionRequestWorker.perform_in(collect_d.id)
      end

      render_jsonapi_response(OrderSerializer.new(@orders))
    else
      render_jsonapi_response(@orders.errors, status: :unprocessable_entity)
    end
  end

  private

  def set_order
  end

  def set_orders  
    raise ActiveRecord::RecordNotFound unless current_user
    @orders = current_user.client.orders.where(filter_params)
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

  def filter_params
    params[:filter] ? params.require(:filter).permit(id: []) : {}
  end
end
