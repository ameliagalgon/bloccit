class PostsController < ApplicationController
  def index
      @posts = Post.all

      #the posts should be updated by the controller
    #   for i in 0..@posts.length
    #       if i % 5 == 0
    #           @posts[i].update(title: "SPAM")
    #       end
    #   end
  end

  def show
  end

  def new
  end

  def edit
  end
end
