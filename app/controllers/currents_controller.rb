class CurrentsController < ApplicationController
  before_action :set_current, only: [:show]

  # GET /currents
  # GET /currents.json
  def index
    @artists = Current.current_artists
  end

  # GET /currents/labels
  # GET /currents/labels.json
  def labels
    @art_pieces = Current.needs_labels
  end

  # GET /currents/1
  # GET /currents/1.json
  def show
    @artists = Current.current_artists
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_params
      params[:current]
    end
end
