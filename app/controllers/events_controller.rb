class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.participants.build
    @participant = @event.participants.new(params[:participants])
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
    params.require(:event).permit(:date, :location, :budget, participants_attributes: [:name, :email] )
  end
