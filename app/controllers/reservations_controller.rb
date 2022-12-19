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
      @room = Room.find(params[:room_id])
       #Roomモデルの中で、roomで、かつ、reservation(予約した)のidを@roomに格納している。これによりnewのviewへ予約確定した内容を表示させることができる
       p 'reservationブレークポイントによって止まりました4'


       end

    def create
      @user = current_user
      @room = Room.find(params[:reservation][:room_id])
      p 'reservationブレークポイントによって止まりました5'
      @reservation = Reservation.new(params.require(:reservation).permit(:people,:room_id,:user_id,:total_day,:start_date,:end_date,:total_price))
      p 'reservationブレークポイントによって止まりました６'
      binding.pry
      if @reservation.save
        binding.pry
        p 'reservationブレークポイントによって止まりました7'
        redirect_to  :room_reservation_path, notice: "予約が完了しました"
      else
        binding.pry
        redirect_to :reservations
        p 'reservationブレークポイントによって止まりました8'

      end
    end

    private
  def reservation_params
    params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:people,:total_day,:total_price)

end
end


