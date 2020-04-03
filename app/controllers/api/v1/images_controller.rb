class Api::V1::ImagesController < ApplicationController
  before_action :authorize_request
  before_action :set_s3_direct_post, only: [:generate_aws_url]

  def create
    @image = Image.new(image_params)
    @image.user = @current_user

    if @image.save
      render json: { image: @image }, status: :ok
    else
      render json: { errors: @image.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    images = Image.select(:id, :image_url).where(user_id: @current_user.id)
    render json: { items: images }
  end

  def generate_aws_url
    render json: { url: @s3_direct_post.url, fields: @s3_direct_post.fields }, status: :ok
  end

  private

  def image_params
    params.permit(:image_url)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(
      key: "uploads/#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      acl: 'public-read'
    )
  end
end
