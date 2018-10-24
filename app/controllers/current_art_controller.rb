class CurrentArtController < ApplicationController
  before_action :authenticate_admin!, :except => [:show, :index]

  # GET /currents
  # GET /currents.json
  def index
    @artists = CurrentArt.current_artists
  end

  # GET /currents/labels
  # GET /currents/labels.json
  def labels
    @art_pieces = CurrentArt.needs_labels
  end

  # GET /currents/1
  # GET /currents/1.json
  def show
    @artists = CurrentArt.current_artists
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_params
      params[:current]
    end
end
