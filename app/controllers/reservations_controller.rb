class ReservationsController < ApplicationController
def index

end

    def new
      @user = current_user
      @reservation = Reservation.new(reservation_params)
      @room = @reservation.room

      if @reservation.invalid?
        @room = @reservation.room
        render "new"
      else
       @room = @reservation.room
       end

    end

    def create
      @reservation = Reservation.new(params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
      if params[:back] || !@reservation.save
        render "index"
      else
        redirect_to  new_room_reservation_path(@reservation), notice: "予約が完了しました"
      end
    end





    private

  def reservation_params
    params.permit(:room_id,:user_id,:start_date,:end_date,:people)
  end
end



