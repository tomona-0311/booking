class ReservationsController < ApplicationController
  def index
  end
  def  new
     @user= current_user

     @room=Room.find(params[:room_id])
     binding.pry
     @reservation = Reservation.new

    end
    def create
      @reservation = Reservation.new(params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
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
