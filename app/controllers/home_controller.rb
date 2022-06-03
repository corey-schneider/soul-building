class HomeController < ApplicationController
  def index
    @posts = Post.all
    set_meta_tags title: 'Home', reverse: false
  end
end
