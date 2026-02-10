class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    redirect_to edit_profile_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to edit_profile_path, notice: "Login realizado com sucesso!"
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
