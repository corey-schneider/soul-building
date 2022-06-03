class PortfolioController < ApplicationController
  def index
    @posts = Post.all
    set_meta_tags title: 'Our Work'
  end
end
