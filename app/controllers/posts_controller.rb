class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy destroy_photos]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
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
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  def destroy_photos
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_to portfolio_path
  end

  # TODO: Revisit this later
  # def set_cover_photo
  #   post = Post.find(params[:id])
  #   attachment = ActiveStorage::Attachment.find(params[:format])
  #   post.update(cover_photo: attachment)
  #   redirect_to portfolio_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :body, photos: [])
  end
end
