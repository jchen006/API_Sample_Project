class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
   @location = Location.find(params[:id])

  end

  def new
    @location = Location.new
  end

  def create
   @location = Location.new(params[:location])    
    if @location.save
      @client = GooglePlaces::Client.new("AIzaSyCbq5JAKHry5HROLhySw3r2BCIkPBlG5cc")
      puts @location.latitude.nil?
      @location.places = @client.spots(@location.latitude, @location.longitude, :types => @location.types)
      for spot in @location.places
         @place = Places.new()
         @place.name = spot.name
         # @place.address = spot.formatted_address
         # @place.location_id = @location.id
         # @place.phone = spot.formatted_phone_number
         @place.save
      end
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
