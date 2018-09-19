class BaristaPhotosController < ApplicationController
  before_action :set_barista_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]

  # GET /barista_photos
  # GET /barista_photos.json
  def index
    @barista_photos = BaristaPhoto.all
  end

  # GET /barista_photos/1
  # GET /barista_photos/1.json
  def show
  end

  # GET /barista_photos/new
  def new
    @barista_photo = BaristaPhoto.new
  end

  # GET /barista_photos/1/edit
  def edit
  end

  # POST /barista_photos
  # POST /barista_photos.json
  def create
    @barista_photo = BaristaPhoto.new(barista_photo_params)
    @barista = @barista_photo.barista

    respond_to do |format|
      if @barista_photo.save
        format.html { redirect_to [@barista, @barista_photo], notice: 'Barista photo was successfully created.' }
        format.json { render :show, status: :created, location: @barista_photo }
      else
        format.html { render :new }
        format.json { render json: @barista_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barista_photos/1
  # PATCH/PUT /barista_photos/1.json
  def update
    respond_to do |format|
      if @barista_photo.update(barista_photo_params)
        format.html { redirect_to [@barista, @barista_photo], notice: 'Barista photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @barista_photo }
      else
        format.html { render :edit }
        format.json { render json: @barista_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barista_photos/1
  # DELETE /barista_photos/1.json
  def destroy
    @barista_photo.destroy
    respond_to do |format|
      format.html { redirect_to barista_barista_photos_url, notice: 'Barista photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barista_photo
      @barista_photo = BaristaPhoto.find(params[:id])
      @barista = @barista_photo.barista
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barista_photo_params
      params.require(:barista_photo).permit(:id, :barista_id, :image, :title, :note, :can_display, :primary_photo)
    end
end
