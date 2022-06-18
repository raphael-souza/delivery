class NotifyCollectionRequestWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(collect_deliveryman_id)

    # TODO:  implementar algum sistema de log aqui

    collect_deliveryman = CollectDeliveryman.find(collect_deliveryman_id)
# TODO : precisa consertar esse relacionamento com entregador
    message_service = MessageService.new()
    message = message_service.send_whatsapp_message(collect_deliveryman.deliveryman.phone, 'corpo da mensagem')

  end

end