class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy destroy_photos set_cover_photo]
  before_action :find_current_post, only: %i[show edit update destroy set_cover_photo]

  def index
    @posts = Post.all
  end

  def show
    @pagy, @post_photos = pagy_array(@post.photos.reverse, items: 8)
    set_meta_tags title: @post.title,
                  description: "One of our jobs in #{@post.title}",
                  author: helpers.full_name(@post.user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  def destroy_photos
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_to portfolio_path
  end

  def set_cover_photo
    attachment = ActiveStorage::Attachment.find(params[:photo_id])
    if @post.update(cover_photo_id: attachment.id)
      redirect_to @post
    else
      render :post, status: :unprocessable_entity
    end
  end

  def find_current_post
    @post = Post.friendly.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, :cover_photo_id, photos: [])
  end
end
