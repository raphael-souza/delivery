class Api::DeliverymenController <  Api::BaseController
  include JsonApiParamsAdapter

  def index

  end

  def show

  end

  def create
    deliveryman = Deliveryman.new(permit_params)
 
    if deliveryman.save()
      render_jsonapi_response(DeliverymanSerializer.new(deliveryman))
    else
      render_jsonapi_response(deliveryman.errors, status: 404)
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_deliveryman

  end

  def permit_params
    params.require(:data).permit(
      :id,
      :name,
      :cpf,
      :phone
      :user_id
      )
  end
end
