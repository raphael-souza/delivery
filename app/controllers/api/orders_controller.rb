require 'twilio-ruby'
class Api::OrdersController <  Api::BaseController
  include JsonApiParamsAdapter

  before_action :set_order, only: [:show, :update, :destroy]
  before_action :set_orders, only: [:index]

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

      # notifica a criação de um pedido
      account_sid = "ACce90dc12414d773e52b5f0616593a6a2" # Your Test Account SID from www.twilio.com/console/settings
      auth_token = "d0c26c5390a5162213855bf92fbbcda0"   # Your Test Auth Token from www.twilio.com/console/settings

      #  SMS
      # @client = Twilio::REST::Client.new account_sid, auth_token
      # message = @client.messages.create(
      #   body: "Hello from Ruby\n Esta mensagem foi disparada através da minas aplicação Ruby!",
      #   to: "+5537999487508",    # Replace with your phone number
      #   from: "+14155238886")  # Use this Magic Number for creating SMS

      # puts message.sid

      # via whatsApp
      # Find your Account SID and Auth Token at twilio.com/console
      # and set the environment variables. See http://twil.io/secure
      # account_sid = ENV['TWILIO_ACCOUNT_SID']
      # auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new(account_sid, auth_token) 
 
      message = @client.messages.create( 
                body: 'Mensgaem do zap do ruby!!! :)', 
                from: 'whatsapp:+14155238886',       
                to: 'whatsapp:+553799487508' 
              ) 
 
      puts message.sid

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
    raise ActiveRecord::RecordNotFound unless current_user
    @orders = current_user.client.orders
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
