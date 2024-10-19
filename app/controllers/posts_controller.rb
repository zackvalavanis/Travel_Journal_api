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
      if @post.save
        @image = Image.new(
          post_id: @post.id, 
          image_url: params[:image_url]
        )
        @image.save
        render :show, status: :created
      else render json: { error: @post.errors.full_messages }, status: :bad_request
    end 
  end 

  def update 
    @post = Post.find_by(id: params[:id])
    @post.update( 
      title: params[:title] || @post.title, 
      text: params[:text] || @post.text,
      user_id: params[:user_id] || @post.user_id
    )
    if @post.save
      render :show, status: :ok 
    else 
      render json: {error: @post.errors.full_messages}, status: :bad_request
    end
  end 

  def destroy 
    @post = Post.find_by(id: params[:id])
    if @post 
      @post.destroy 
      render json: { message: 'The post has been deleted.'}, status: :ok
    else 
      render json: {messages: 'There arnt any posts from that user.'}
    end 
  end 
end