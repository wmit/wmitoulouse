class Wmit::EventsController < ApplicationController
  def index
    @events = Wmit::Event.feed
  end

  def show
    @event = Wmit::Event.online.find params[:id]
  end

  def edit
    @event = Wmit::Event.online.find params[:id]
  end

  def new
    @event = Wmit::Event.new
  end

  def create
    @event = Wmit::Event.new(params[:event])
    if @event.save
      redirect_to @event
    else
      render action: 'new'
    end
  end

  def update
    @event = Wmit::Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to @event
    else
      render action: 'edit'
    end
  end

  def destroy
    event = Wmit::Event.find params[:id]
    event.destroy
    redirect_to wmit_events_path
  end
end