class InventoriesController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])

    @rental.housing.rooms.each do |room|
      @rental.inventories.new(room: room)
    end
    authorize @rental.inventories.first
  end

  def index
    @rental = Rental.find(params[:rental_id])
    @housing = @rental.housing
    @owner = current_user
    @renter = @rental.renter
    policy_scope @rental.inventories
  end


  def create
    @rental = Rental.find(params[:rental_id])

    authorize Inventory.new

    if @rental.update(rental_params)
      redirect_to rental_inventories_path(@rental), notice: 'Votre état des lieux est enregistré.'
    else
      render :new
    end

  end

  private
  def rental_params
    params.require(:rental).permit(inventories_attributes: [:room_id, :state, :observations])
  end


end
