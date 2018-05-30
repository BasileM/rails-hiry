class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room)
    @rooms = Room.all
  end

  def new
    @housing = Housing.find(params[:housing_id])
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    @room.housing = Housing.find(params[:housing_id])
    authorize @room
    if @room.save
      redirect_to housing_path(@room.housing_id), notice: 'Votre pièce est ajoutée.'
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:type, :size, :state, :observations)
  end
end
