class UsersController < ApplicationController

  def new
    @user = User.new
    # @ip = request.remote_ip
    # @ip2 = request.env["HTTP_X_FORWARDED_FOR"]
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

    if @user.save # sign up was success
      redirect_to "/login"
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

end