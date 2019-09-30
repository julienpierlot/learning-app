class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    if params[:email].present?
      emails = params[:email].split( /, */ )
      _participants = @event.add_participant(emails)
    end
      if @event.save
        redirect_to @event
      else
        render 'new'
      end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end


  def edit
    @event = Event.find(params[:id])
  end

end


private

  def event_params
    params.require(:event).permit(:name, :date, :location, :budget)
  end
