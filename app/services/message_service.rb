class MessageService

  def initialize 
    @account_sid = "ACce90dc12414d773e52b5f0616593a6a2" # Your Test Account SID from www.twilio.com/console/settings
    @auth_token = "2c3e9e50820c92842feaa3eb042e7e9d" # tem que atualizar sempre esse token
    begin
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    rescue => errors
      # erro ao criar conexão com Twilio
      raise errors
    end
  end

  def list_messages
    array_message = []

    messages = @client.messages.list(limit: 20)      

    messages.each do |record|
      array_message <<  {sid: record.sid, body: record.body, from: record.from, to: record.to } 
    end 
    
    return array_message
  end

  def send_whatsapp_message(to=nil, from)
    # via whatsApp
    # Find your Account SID and Auth Token at twilio.com/console
    # and set the environment variables. See http://twil.io/secure

    to = to.nil? ? '+14155238886' : to

    message = @client.messages.create( 
              body: 'Mensgaem do zap do ruby!!! :)', 
              from: "whatsapp:#{to}",
              status_callback: 'https://timberwolf-mastiff-9776.twil.io/sandbox-r2tec-status',       
              to: "whatsapp:+55#{from}",
            ) 

    return message
  end

  def send_sms_message(to, from)
    # SMS
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Hello from Ruby\n Esta mensagem foi disparada através da minas aplicação Ruby!",
      to: "+5537999487508",    # Replace with your phone number
      from: "+14155238886")  # Use this Magic Number for creating SMS

    return message
  end

end
