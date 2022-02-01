class Api::CollectsController < ApplicationController
  def index
    render_jsonapi_response(CollectSerializer.new(Orders.all))
  end

  def show

  end

  def create
    debugger 
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

  def set_collects
  end

  def collect_params
    params.require(:collect).permit(
      :description, 
      :status, 
      :total_orders, 
      :total_value
    )
  end
end
