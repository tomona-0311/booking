class RoomsController < ApplicationController

    def index
      @rooms = Room.all

    end

    def new

      @room = Room.new
    end

    def create

      @room = Room.new(params.require(:room).permit(:room_name,:price,:address,:introduction,:image))
      if @room.save
        flash[:notice] = "ルーム情報を新規登録しました"
        redirect_to :rooms
      else
        flash[:notice] = "登録できませんでした。もう一度入力してください"
        render "new"
      end
    def show
      @room=Room.find(params[:id])
      @user = current_user
    end
  end


end