class PlacePhotosController < ApplicationController
  before_action :set_place_photo
  # before_action :authenticate_admin!, :except => [:show, :index]

  # GET /place_photos
  # GET /place_photos.json
  def index
    if (admin_signed_in?)
      @place_photos = @place.place_photos
    else
      @place_photos = @place.place_photos.where(can_display: true)
    end
  end

  # GET /place_photos/1
  # GET /place_photos/1.json
  def show
  end

  # GET /place_photos/new
  def new
    @place_photo = PlacePhoto.new
  end

  # GET /place_photos/1/edit
  def edit
  end

  # POST /place_photos
  # POST /place_photos.json
  def create
    @place_photo = PlacePhoto.new(place_photo_params)

    respond_to do |format|
      if @place_photo.save
        format.html { redirect_to place_place_photos_url, notice: 'Place photo was successfully created.' }
        format.json { render :show, status: :created, location: @place_photo }
      else
        format.html { render :new }
        format.json { render json: @place_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place_photos/1
  # PATCH/PUT /place_photos/1.json
  def update
    respond_to do |format|
      if @place_photo.update(place_photo_params)
        format.html { redirect_to [@place, @place_photo], notice: 'Place photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @place_photo }
      else
        format.html { render :edit }
        format.json { render json: @place_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_photos/1
  # DELETE /place_photos/1.json
  def destroy
    @place_photo.destroy
    respond_to do |format|
      format.html { redirect_to place_place_photos_url, notice: 'Place photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_photo
logger.info "Inside set_place_photo"
      if (!params[:id].blank?)
        @place_photo = PlacePhoto.find(params[:id])
        @place = @place_photo.place
logger.info "found place_photo id and looked up photo and place. Place = #{@place.id.to_s} #{@place_photo.id.to_s}"
      end
      if (@place.blank? && !params[:place_id].blank?)
        @place = Place.find(params[:place_id])
logger.info "No photo id, but there is a place id Place = #{@place.id.to_s}"
      end
      if (@place.blank?)
        @place = Place.all.first;
logger.info "Use the default place Place = #{@place.id.to_s}"
      end
      if (@place_photo.blank?) 
        @place_photos = @place.place_photos
logger.info "Setting place photos from place Place = #{@place.id.to_s}"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_photo_params
      params.require(:place_photo).permit(:id, :place_id, :image, :title, :note, :can_display)
    end
end
