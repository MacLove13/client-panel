class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :require_login
  before_action :require_password_change

  helper_method :current_user, :logged_in?, :admin?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end

  def require_password_change
    if logged_in? && current_user.must_change_password? && !password_change_controller?
      redirect_to force_password_change_path, alert: "Você precisa alterar sua senha antes de continuar."
    end
  end

  def require_admin
    unless admin?
      redirect_to dashboard_path, alert: "Acesso restrito a administradores."
    end
  end

  def password_change_controller?
    controller_name == "password_changes" || (controller_name == "sessions" && action_name == "destroy")
  end
end
