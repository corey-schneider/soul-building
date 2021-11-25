class PortfolioController < ApplicationController
  def index
    @posts = Post.all
  end
end
