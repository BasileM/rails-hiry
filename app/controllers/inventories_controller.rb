class InventoriesController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])

    @rental.housing.rooms.each do |room|
      @rental.inventories.new(room: room)
    end
    authorize @rental.inventories.first
  end

  def show
    @rental = Rental.find(params[:rental_id])
    authorize @rental.inventories.first
  end


  def create
    @rental = Rental.find(params[:rental_id])
    authorize Inventory.new

    if @rental.update(rental_params)
      redirect_to rental_path(@rental), notice: 'Votre état des lieux est enregistré.'
    else
      render :new
    end

  end

  private
  def rental_params
    params.require(:rental).permit(inventories_attributes: [:room_id, :state, :observations])
  end


end
