class WelcomeController < ApplicationController

  def index
    render json: [date_time: DateTime.now], status: :ok
  end
end
