class MessageService

  def initialize 
    account_sid = "ACce90dc12414d773e52b5f0616593a6a2" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "b71db2e175137262bbfebe741319cde9" # tem que atualizar sempre esse token
    @from = '+14155238886' # número do twilio para disparar as mensagens

    @to = '+5537999487508'

    # --------------------------#
    # to -> número de desdito  (para) #
    # from -> número de origem  (de)#
    #---------------------------#
    begin
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    rescue => errors
      # erro ao criar conexão com Twilio
      raise errors
    end
  end

  def list_messages
    array_message = []

    messages = @client.messages.list(from: 'whatsapp:+553799487508', date_sent: Time.now, limit: 20)      

    messages.each do |record| 
      array_message <<  {sid: record.sid, body: record.body, from: record.from, to: record.to } 
    end 
    
    return array_message
  end

  def send_whatsapp_message(to, body_message)
    # via whatsApp
    # Find your Account SID and Auth Token at twilio.com/console
    # and set the environment variables. See http://twil.io/secure

    message = @client.messages.create( 
              body: "Pedido novo na área!\n#{body_message}", 
              from: "whatsapp:#{@from}",
              status_callback: 'https://timberwolf-mastiff-9776.twil.io/sandbox-r2tec-status',       
              to: "whatsapp:#{to}",
            ) 
 
    return message
  end

  def send_sms_message(to, body_message)
    # SMS
    message = @client.messages.create(
      body: "Pedido novo na área!\n #{body_message}",
      to: "#{to}",    # Replace with your phone number
      from: @from)  # Use this Magic Number for creating SMS

    return message
  end

  def list_whatsapp_messages_by_filter(to=nil, from=nil, date_sent=nil)
    to ||= '+5537999487508'
    from ||= @from

    messages = @client.messages.list(
      date_sent: Time.now - 1.day,
      from: "whatsapp:#{from}",
      to: "whatsapp:#{to}",
      limit: 20
    )
    messages_sirialized = []
    messages.each do |record| 
      messages_sirialized << { 
        sid: record.sid, 
        to: record.to, 
        from: record.from, 
        body: record.body,
        date_created: record.date_created,
        date_sent: record.date_sent
      
      }
    end

    return messages_sirialized
  end
  # step 1
  def conversation
    conversation = @client.conversations
    .conversations
    .create(friendly_name: 'SMS-to-WhatsApp Exemplo de conversa ')

    debugger 
    return { sid: conversation.sid, name: conversation.friendly_name }
  end
  #step 2
  def add_participant_to_conversation(sid_conversation)
    participant = @client.conversations
    .conversations(sid_conversation)
    .participants
    .create(
      messaging_binding_address: "whatsapp:+5537998650779", #YOUR_WHATSAPP_NUMBER
      messaging_binding_proxy_address: "whatsapp:#{@from}" #TWI_WA_NUMBER
    )

    return participant.sid
  end
  #step 3
  def send_message_conversation

  end
end
