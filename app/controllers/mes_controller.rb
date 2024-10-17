class MesController < ApplicationController

  def index 
    if current_user
      mes = Me.all
      render :index
    else 
      render json: { error: 'unauthorized'}, status: :unauthorized
    end
  end 

  def show 
    me = Me.find_by(id: params[:id])
    render :show
  end 

  def create 
    me = Me.new(
      user_id: current_user,
      information: params[:information]
    )
    me.save
  end 

  def update 
    me = Me.find_by(id: params[:id])
    me.update( 
      information: params[:information] || me.information
    )
    if me.update 
      render :show, status: :okay 
    else 
      render json: {error: me.errors.full_messages}, status: :bad_request
    end
  end 

  def destroy 
    me = Me.find_by(id: params[:id])
    if me 
      me.destroy 
      render json: { message: 'The post has been deleted.'}, status: :ok
    else 
      render json: {messages: 'There arnt any posts from that user.'}
    end 
  end 
end
