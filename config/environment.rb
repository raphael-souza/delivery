# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# deve ter o ngrok instalado
# executar ->  ngrok http 3000
#  inserir no twilio com /bot no fim -> https://ebfb-138-36-48-190.sa.ngrok.io/bot
Rails.application.routes.default_url_options = { :host => "https://eca5-138-36-48-190.sa.ngrok.io" }


