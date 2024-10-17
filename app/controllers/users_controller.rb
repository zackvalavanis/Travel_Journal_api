class UsersController < ApplicationController
  def show 
    @user = current_user
    if @user
      render :show
    else 
      render json: { error: 'unauthorized'}, status: :unauthorized
    end 
  end

  def create 
    @user = User.new(
      name: params[:name], 
      email: params[:email], 
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save 
      render json: { message: 'User created successfully.'}, status: :created
    else
      render json: { error: @user.errors.full_messages}, status: :bad_request
    end
  end

end
