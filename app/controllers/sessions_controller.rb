class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]
  skip_before_action :require_password_change, only: [ :new, :create, :destroy ]

  def new
    redirect_to dashboard_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      if user.must_change_password?
        redirect_to force_password_change_path, alert: "Você precisa alterar sua senha antes de continuar."
      else
        redirect_to dashboard_path, notice: "Login realizado com sucesso!"
      end
    else
      flash.now[:alert] = "Usuário ou senha inválidos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logout realizado com sucesso!"
  end
end
