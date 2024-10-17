class PostsController < ApplicationController
  def index 
    @posts = Post.all
    render :index
  end 

  def show 
    @post = Post.find_by(id: params[:id])
    render :show
  end 

  def create 
    @post = Post.new(
      title: params[:title], 
      text: params[:text],
      user_id: params[:user_id]
    )
    @post.save
    render :show
  end 

  def update 
    @post = Post.find_by(id: params[:id])
    @post.update( 
      title: params[:title] || @post.title, 
      text: params[:text] || @post.text,
      user_id: params[:user_id] || @post.user_id
    )
    if @post.update 
      render :show, status: :okay 
    else 
      render json: {error: @post.errors.full_messages}, status: :bad_request
  end 

  def destroy 
    @post = Post.find_by(id: params[:id])
    @post.destroy 
    render json: { message: 'The post has been deleted.'}, status: :ok
  end 

end
