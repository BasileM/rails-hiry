class HousingsController < ApplicationController
  def index
    @housings = Housing.all
  end
end
