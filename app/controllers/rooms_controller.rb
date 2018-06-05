class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room)
    @rooms = Room.all
  end

  def new
    @housing = Housing.find(params[:housing_id])
    @room = Room.new
    @room.images.new # for photo upload
    authorize @room

    @rooms = Room.where(housing_id: @housing.id)
  end

  def create
    @room = Room.new(room_params)
    @housing = Housing.find(params[:housing_id])
    @room.housing = @housing
    authorize @room

    if @room.save
      respond_to do |format|
        format.html { redirect_to new_housing_room_path(@room.housing) }
        format.js  # <-- will render `app/views/room/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:type_of_room, :size, :state, :observations, images_attributes: [:photo])
  end
end
