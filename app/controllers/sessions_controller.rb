class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(name: params[:name])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, alert: "Invalid password."
      end
    else
      redirect_to login_url, alert: "User doesn't exist."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
