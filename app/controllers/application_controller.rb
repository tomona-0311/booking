class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録完了しました。次に名前を入力してください"
    pages_home_path
  end
  def after_sign_in_path_for(resource)
    pages_home_path#遷移先のパス
  end
  def destroy
    log_out
    redirect_to pages/home_url
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
