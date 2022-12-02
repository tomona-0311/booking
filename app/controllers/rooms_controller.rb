class RoomsController < ApplicationController

    def index
      @rooms = Room.all

    end
    def  post
      @rooms = Room.all

    end
    def new

      @room = Room.new
    end

    def create
      @user = current_user
      @room = Room.new(params.require(:room).permit(:room_name, :introduction,:price,:address,:image))
      p 'ブレークポイントによって止まりました１'

      if @room.save
        p 'ブレークポイントによって止まりました２'

        redirect_to :rooms_new ,notice: "ルーム情報を新規登録しました"
        p 'ブレークポイントによって止まりました３'

     else      render "new"
      p 'ブレークポイントによって止まりました４'

     end
     end

    def show
      @room = Room.find(params[:id])
      @user = current_user
    end
  end

