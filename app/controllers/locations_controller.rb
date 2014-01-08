class LocationsController < ApplicationController
  def index
     if params[:search].present?
        @locations = Location.near(params[:search], 50, :order => :distance)
    else
        @locations = Location.all
    end
  end

  def show
   @location = Location.find(params[:id])
   @ll = @location.longitude.to_s + ","+ @location.latitude.to_s
   @venues = foursquare.venues.search(:query => @location.venue, :ll => @ll)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    #Need to migrate a string 
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

  # def venues_search 
  #    @location = Location.find(params[:id])
  #    @ll = @location.longitude.to_s + @location.latitude.to_s
  #    if params[:name]
  #       @venues = foursquare.venues.search(:query => params[:name], :ll => @ll)
  #     end
  # end 

end
