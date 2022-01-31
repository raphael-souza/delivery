class Api::CollectsController < ApplicationController
  def index

  end

  def show

  end

  def create
    collect = Collect.new(collect_params)
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
  end

  def set_collections
  end

  def collect_params
    params.require(:collect).permit(
      :description, 
      :recipient_name, 
      :paid_aout, 
      :value, 
      :address_id, 
      :collect_id, 
      :user_id)
  end
end
