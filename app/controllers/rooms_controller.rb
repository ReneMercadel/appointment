class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  def index
    @rooms = Room.all
  end

  def show
    
  end
  
  # action that shows page where I want to show form to create new room
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    # use "respond_to" to define different formats I want my app to respond to
    respond_to do |format|
       # if room is created
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was created successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  # private callback action to call at top of class so set current room value
  private
  def set_room
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name, :capacity)
  end
end
