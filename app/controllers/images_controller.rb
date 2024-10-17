class ImagesController < ApplicationController
  def create 
    image = Image.new(
      post_id: params[:post_id], 
      image_url: params[:image_url]
    )
    if image.save
      render json: {messages: "The image has been saved"}, status: :created
    else 
      render json: { errors: images.errors.full_messages}, status: :bad_request
    end 
  end 
end
