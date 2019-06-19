class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate params[:session][:password]
      log_in user
      check_box_remember user
      redirect_to root_path
    else
      flash.now[:danger] = t "sessions.new.invalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def check_box_remember user
    session_remember_me = params[:session][:remember_me]
    session_remember_me == Settings.boolean_box ? remember(user) : forget(user)
  end
end
