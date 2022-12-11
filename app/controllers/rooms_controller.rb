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
        redirect_to :rooms ,notice: "ルーム情報を新規登録しました"
     else
       render "new"
     end
   end



    def show
      @room = Room.find(params[:id])
      @user = current_user
      @reservations = Reservation.new
    end

    def update
      @user = current_user
      @room = Room.create!(room_params)

      if @room.update(params.require(:room).permit(:room_name, :introduction,:price,:address,:image,:id,:people,:room_id,:user_id,:start_date, :end_date))
        flash[:notice] = "スケジュールの予約「#{@room.id}」の情報を更新しました"
        redirect_to :new_room_reservation_path
        render "show"
      end
    end
    private
    def room_params
      params.require(:room).permit(:room_name, :introduction,:price,:address,:image)
    end
  end

