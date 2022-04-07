class Api::MessagesController < ApplicationController
  include JsonApiParamsAdapter
  include ActionController::MimeResponds

  # use Rack::TwilioWebhookAuthentication, 'b71db2e175137262bbfebe741319cde9', '/bot'
  # use Rack::TwilioWebhookAuthentication, Rails.application.config_for(:delivery)[:twilio_auth_token], '/bot'
  
  def index
    message_service = MessageService.new()
    messages = message_service.list_messages()
    # messages = message_service.conversation()
    # messages = message_service.list_whatsapp_messages_by_filter()

    #id da Jessica na conversa => MBa8a5f3ed485f4a5582218259d4c5979e
    #id Raphael => CHdfc00ad4dab645c3b48c21c277d31aaa
    # messages = message_service.add_participant_to_conversation('CHdfc00ad4dab645c3b48c21c277d31aaa')

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
      format.html
      format.xml { render :xml => response.to_xml }
    end

  end

  def send_message
    message_service = MessageService.new()

    begin
      message = message_service.send_whatsapp_message('+5537999487508', 'corpo da mensagem')
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
