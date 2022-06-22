class Bot::MessagesController < ApplicationController
  include JsonApiParamsAdapter
  include ActionController::MimeResponds

  # use Rack::TwilioWebhookAuthentication, 'b71db2e175137262bbfebe741319cde9', '/bot'
  # use Rack::TwilioWebhookAuthentication, Rails.application.config_for(:delivery)[:twilio_auth_token], '/bot'
  
  def index
    message_service = MessageService.new()
    messages = message_service.list_whatsapp_messages()

    render_jsonapi_response(messages)
  end

  def bot
    # teste bot de comunicação com entregador 
    body = params["Body"].downcase
    response = Twilio::TwiML::MessagingResponse.new

    response.message do |message| 
      if body.include?("ok")
        message.body("solicitação de coleta foi recebida! Venha até o ponto de venda imediatamente. Obrigado")
      elsif body.include?("cancelar")
        message.body("Tudo bem. Você não receberá mais mensagem durante este dia.")
      else
        message.body("Desculpe, não entendi o que você quis dizer... :(")
      end
    end

    respond_to do |format|
      format.xml { render :xml => response.to_xml }
    end

  end

  def create
    message_service = MessageService.new()

    message = "mensagem da request #{ params[:message]}"
    begin
      message = message_service.send_whatsapp_message('+5537999487508', message)
      return render json: {sid: message.sid, body: message.body}, status: :ok
      
    rescue => errors
      return render_jsonapi_response(errors, status: :unprocessable_entity)
    end
  end

end

  
  # criar uma conversation com o numero do pedido, será disparada para todos os entregadores
  # criar function que verifica quem aceita o pedido
  # confirmar a entrega

  #  enviar mensagens para entregadores qdo existir coleta
  # criar link na msg e solicitar coleta do pedido
  # notificar que o pedido de coleta foi aceito
