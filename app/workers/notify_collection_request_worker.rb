class NotifyCollectionRequestWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(collect_deliverymen_id)
    puts('##########################')
    puts(collect_deliverymen_id) 
  end

end