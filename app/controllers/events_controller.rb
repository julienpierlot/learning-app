class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :show, :edit]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    _participants = @event.add_participant(params["email"].split( /, */ ))
    @event.user = current_user
      if @event.save!
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
