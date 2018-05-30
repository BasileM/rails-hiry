class HousingsController < ApplicationController
  def index
    @housings = policy_scope(Housing)
    @housings = Housing.all
  end

   def show
    @housing = Housing.find(params[:id])
    authorize @housing
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

  def housing_params
    params.require(:housing).permit(:street, :zip_code, :city, :type_of_housing, :legal_regime, :year_of_construction, :floor, :size)
  end
end

