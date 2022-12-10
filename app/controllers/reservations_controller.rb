class ReservationsController < ApplicationController
  def index
  end
  def  new
     @user= current_user

     @room = Room.find(params[:id])
     binding.pry
     @reservation = Reservation.new

    end
    def create
      @reservation = Reservation.create(params(reservation_params))
      if params[:back] || !@reservation.save
        render "index"
      else
        redirect_to  reservation_path(@reservation), notice: "予約が完了しました"
      end
    end



    private

    def reservation_params
      params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:people)
    end


end
