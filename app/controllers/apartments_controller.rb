class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :map_all_locations, :show, :map_location]
  load_and_authorize_resource

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    if @apartment.user_id == current_user.id || current_user.has_role?(:admin)
      respond_to do |format|
        if @apartment.update(apartment_params)
          format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
          format.json { render :show, status: :ok, location: @apartment }
        else
          format.html { render :edit }
          format.json { render json: @apartment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    if @apartment.user_id == current_user.id || current_user.has_role?(:admin)
      @apartment.destroy
      respond_to do |format|
        format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def map_location
    @apartment = Apartment.find(params[:apartment_id]);
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng(apartment.longitude)
      marker.infowindow("<em>" + apartment.full_address + "</em>")
    end
    render json: @hash.to_json
  end

  def map_all_locations
    @apartments = Apartment.all
    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng(apartment.longitude)
    end
    render json: @hash.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:latitude, :longitude, :address1, :address2, :city, :zip, :state, :country, :name, :phone_number, :hours, :image, :user_id)
    end
end
