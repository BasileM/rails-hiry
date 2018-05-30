class RentersController < ApplicationController

  def new
    @renter = Renter.new
    authorize @renter
  end
end
