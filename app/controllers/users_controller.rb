class UsersController < ApplicationController
  before_action :authenticate_user!
  def account
    @user = current_user
  end
  def profile
    @user = current_user

  end
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name ,:profile))
      flash[:notice]="更新しました"
      redirect_to :user_profile
    else
      flash.now[:notice]="更新に失敗してしまいました、再入力してください"
      redirect_to :user_profile
    end
end
end