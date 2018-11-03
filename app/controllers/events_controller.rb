class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]

  # GET /events
  # GET /events.json
  def index
    unit = :months
    amount = 1
    @show_all = (params[:show_all] == 'true') ? true : false
    if (admin_signed_in? && @show_all)
      @events = all_events(unit, amount)
      @recurrent_events = all_recurrent_events()
    else
      @events = future_events(unit, amount)
      @recurrent_events = recurrent_events()
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def future_events(unit, amount)
      if (admin_signed_in?)
        active_clause = '1'
      else
          active_clause = 'active = true'
      end
      Event.where('recurrent != true').where(active_clause).where('event_start > ?', DateTime.now).where('event_end < ?', DateTime.now.advance({unit => amount})).order(:event_start)
    end

    def all_events(unit, amount)
      Event.where('recurrent != true').order(:active).order(event_start: :desc)
    end

    def recurrent_events
      if (admin_signed_in?)
        active_clause = '1'
      else
          active_clause = 'active = true'
      end
      Event.where('recurrent = true').where(active_clause).order(:recurrence_days)
    end

    def all_recurrent_events
      Event.where('recurrent = true').order(:active).order(:recurrence_days)
    end

    def format_event_date(event)
      if (event.event_start.strftime("%Y-%m-%d") == event.event_end.strftime("%Y-%m-%d"))
        rv = event.event_start.strftime("%A %B %e %l:%M%P") + event.event_end.strftime(" - %l:%M%P")
      else
        rv = event.event_start.strftime("%A %B %e %l:%M%P") + event.event_end.strftime(" - %A %B %e %l:%M%P")
      end
      return rv
    end

    def html_notification_date(event)
      if (event.notify_start.strftime("%Y-%m-%d") == event.notify_end.strftime("%Y-%m-%d"))
        rv = '<div class="EventDateTime">' +
               '<span class="Date">' +
                 event.notify_start.strftime("%A %B %e") +
               '</span>' +
               '<span class="Time">' +
                 event.notify_start.strftime("%l:%M%P") + event.notify_end.strftime(" - %l:%M%P") +
               '</span>' +
             '</div>'
      else
        rv = '<div class="EventDateTime">' +
               'Notify From: <span class="StartDate NoBreak">' +
                   event.notify_start.strftime("%A %B %e %l:%M%P") +
               '</span>' +
               'To: <span class="EndDate NoBreak">' +
                  event.notify_end.strftime(" %A %B %e %l:%M%P") +
               '</span>' +
             '</div>'
      end
      return rv
    end

    def html_event_date(event)
      if (event.event_start.strftime("%Y-%m-%d") == event.event_end.strftime("%Y-%m-%d"))
        rv =
             '<div class="EventDateTime">' +
               '<span class="Date">' +
                 event.event_start.strftime("%A %B %e") +
               '</span>' +
               '<span class="Time">' +
                 event.event_start.strftime("%l:%M%P") + event.event_end.strftime(" - %l:%M%P") +
               '</span>' +
            '</div>'
      else
        rv = '<div class="EventDateTime">' +
               '<span class="StartDate">' +
                   event.event_start.strftime("%A %B %e %l:%M%P") +
               '</span>' +
               '<span class="EndDate">' +
                  event.event_end.strftime(" %A %B %e %l:%M%P") +
               '</span>' +
            '</div>'
      end
      return rv
    end

    def html_recurrent_event_time(event)
        rv =
             '<div class="EventDateTime">' +
               '<span class="Time">' +
                 event.event_start.strftime("%l:%M%P") + event.event_end.strftime(" - %l:%M%P") +
               '</span>' +
            '</div>'
      return rv
    end
helper_method :html_notification_date
helper_method :html_event_date
helper_method :html_recurrent_event_time


    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_start, :event_end, :active, :title, :description, :event_image_id, :recurrence_description, :recurrence_days, :recurrent, :display_notify, :display_event, :notify_title, :notify_start, :notify_end)
    end
end
