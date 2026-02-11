class PasswordChangesController < ApplicationController
  skip_before_action :require_password_change

  def edit
    @user = current_user
    redirect_to dashboard_path unless @user.must_change_password?
  end

  def update
    @user = current_user

    unless @user.must_change_password?
      redirect_to dashboard_path
      return
    end

    if @user.update(password_params.merge(must_change_password: false))
      redirect_to dashboard_path, notice: "Senha alterada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
