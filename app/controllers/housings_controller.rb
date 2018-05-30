class HousingsController < ApplicationController
  before_action :set_housing, only: [:show]

  def index
    @housings = policy_scope(Housing)
    @housings = Housing.all
  end

  def show
    authorize @housing
    @rentals = Rental.all
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
      redirect_to housings_path, notice: 'Votre bien est créé.'
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

