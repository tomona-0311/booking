class RoomsController < ApplicationController

    def index
      @rooms = Room.all
      @user = current_user
    end

    def  post
      @rooms = Room.all
    end

    def new
      @user = current_user
      @room = Room.new
    end

    def create
      @user = current_user
      @room = Room.create!(room_params)
      p 'ブレークポイントによって止まりました１'
      if @room.save
        p 'ブレークポイントによって止まりました2'
        redirect_to controller: :rooms, action: :show, id:1
     else
       render "new"
     end
   end

    def show
      @room = Room.find(params[:id])
      p 'roomブレークポイントによって止まりました１'
      @user = current_user
      p 'roomブレークポイントによって止まりました2'
      @reservation = Reservation.new
      p 'roomブレークポイントによって止まりました３'
    end

    def serch

    end


    private
    def room_params
      params.require(:room).permit(:room_name, :introduction,:price,:address,:image)
    end
  end

