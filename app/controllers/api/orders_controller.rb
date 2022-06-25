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
    order = current_user.store.orders.new(order_params)

    if order.save()
      render_jsonapi_response(OrderSerializer.new(order))
    else
      render_jsonapi_response(order.errors, status: 404)
    end
  end

  def update
    if @order.update()
      render_jsonapi_response(OrderSerializer.new(order))
    else
      render_jsonapi_response(order.errors, status: 404)
    end
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
 
      collect_deliverymen.each do |collect_d| 
        NotifyCollectionRequestWorker.perform_async(collect_d.id)
      end

      render_jsonapi_response(OrderSerializer.new(@orders))
    else
      render_jsonapi_response(@orders.errors, status: :unprocessable_entity)
    end
  end

  private

  def set_order
    @order = current_user.orders.find_by(id: params[:id])

    return raise ActiveRecord::RecordNotFound unless @order
  end

  def set_orders 
    @orders = current_user.store.orders.where(filter_params)
  end

  def order_params
    params.require(:data).permit(
      :id,
      :description,
      :status,
      :recipient_name,
      :paid_out,
      :value,
      :store_id,
      :created_at,
      :updated_at,
      :collect_id,
      :formated_address,
      :lat, 
      :long,
    )
  end

  def filter_params
    params[:filter] ? params.require(:filter).permit(id: []) : {}
  end
end
