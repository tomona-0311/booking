class ReservationsController < ApplicationController
def index

end

    def new
      p 'reservationブレークポイントによって止まりました１'
      @user = current_user
      p 'reservationブレークポイントによって止まりました2'
      @reservation = Reservation.new(reservation_params)
      p 'ブレークポイントによって止まりました3'


      @room = @reservation.room


       #Roomモデルの中で、roomで、かつ、reservation(予約した)のidを@roomに格納している。これによりnewのviewへ予約確定した内容を表示させることができる
       p 'reservationブレークポイントによって止まりました4'

      end

    def create
      p 'reservationブレークポイントによって止まりました5'

      @reservation = Reservation.new(params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
      if @reservation.save
        p 'reservationブレークポイントによって止まりました６'
        redirect_to  reservation/index
      else
        redirect_to  new_reservation_path(@reservation,room_id), notice: "予約が完了しました"
      end
    end





    private

  def reservation_params
    params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:people)
  end
end



