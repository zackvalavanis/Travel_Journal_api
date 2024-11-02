class PostsController < ApplicationController
  def index 
    if current_user
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      limit = params[:limit].to_i > 0 ? params[:limit].to_i : 10
      offset = (page - 1) * limit
  
      @posts = Post.includes(:images).where(user_id: current_user.id).limit(limit).offset(offset)
      total_posts = Post.where(user_id: current_user.id).count
  
      # Render posts along with images URLs
      render json: {
        posts: @posts.as_json(include: { images: { only: [:image_url] } }),
        totalPosts: total_posts
      }
    else 
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
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