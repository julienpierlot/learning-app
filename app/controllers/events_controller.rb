class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    if params.slice(:email).fetch("email") != ""
      participants = params.slice(:email).fetch("email").split(',')
      participants.each do |email|
        participant = Participant.new(email: email)
        @event.participants.push(participant)
      end
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
