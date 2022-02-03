class Api::CollectsController < Api::BaseController
  include JsonApiParamsAdapter

  before_action :set_collects, only: [:index]
  before_action :set_collect, only: [:show, :update, :destroy]
  
  def show
    render_jsonapi_response(CollectSerializer.new(@collect))
  end

  def index 
    render_jsonapi_response(CollectSerializer.new(@collects))
  end

  def create 
    collect = Collect.new(collect_params) 
    collect.client_id = current_user.client.id

    if collect.save
      render_jsonapi_response(CollectSerializer.new(collect))
    else
      render_jsonapi_response(collect.errors)
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_collect
    debugger 
    @collect = current_user.client.collects
  end

  def set_collects
    @collects = current_user.client.collects
  end

  def collect_params
    params.require(:data).permit(
      :description, 
      :status, 
      :total_orders, 
      :total_value,
      orders_attributes: [
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
      ]
    )
  end
end
