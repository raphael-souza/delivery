class RoomsController < ApplicationController

  def index 
    rooms = Room.all
    render json: rooms
  end

  def create
    #veridica se room existe
    if Room.find_by(name: params[:name]) === nil
      room = Room.create(room_params)

    else
      room = Room.find_by(name: params[:name])
    end

    ActionCable.server.broadcast 'rooms_chanel', room
    head :ok
  end
  
end
