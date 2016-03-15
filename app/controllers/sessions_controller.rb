class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    if user = User.find_by(name: params[:name])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to users_path
      else
        redirect_to login_url, alert: "Invalid password."
      end
    else
      redirect_to login_url, alert: "User doesn't exist."
    end
  end

  def destroy
    session[:user_id] = nil
    puts "desotry"
    redirect_to login_path, notice: "Logged out"
  end
end
