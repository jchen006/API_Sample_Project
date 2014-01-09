class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
   @location = Location.find(params[:id])
   # @client = GooglePlaces::Client.new(AIzaSyD5i2AC5JHNBxRSx_hQ2qDpLjX58uXyTfg)
   # @places = @client.spots(-33.8670522, 151.1957362, :types => '@location.place')
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end
end
