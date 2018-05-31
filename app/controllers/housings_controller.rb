class HousingsController < ApplicationController
  before_action :set_housing, only: [:show]

  def index
    @housings = policy_scope(Housing)
    @housings = Housing.all

    # Geocoding
    @housings = Housing.where.not(latitude: nil, longitude: nil)
    @markers = @housings.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude#,
        # infoWindow: { content: render_to_string(partial: "/housings/map_box", locals: { house: house }) }
      }
    end
  end


  def show
    authorize @housing

    @rentals = @housing.rentals
    @rental = @rentals.last
    #précédente version conservée par sécurité
    #@rentals = Rental.all
    #@rental  = @rentals.last

    #change to display only rental where housing_id == housing.id
  end

  def new
    @housing = Housing.new
    authorize @housing
  end

  def create
    @housing = Housing.new(housing_params)
    @housing.user = current_user #need a user to save the housing.
    authorize @housing
    if @housing.save
      redirect_to new_housing_room_path(@housing), notice: 'Votre bien est créé.'
    else
      render :new
    end
  end

  private

  def set_housing
    @housing = Housing.find(params[:id])
  end

  def housing_params
    params.require(:housing).permit(:street, :zip_code, :city, :type_of_housing, :legal_regime, :year_of_construction, :floor, :size)
  end
end
