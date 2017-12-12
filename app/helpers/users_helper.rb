module UsersHelper

  def has_posts?
    return @user.posts.size > 0
  end

  def has_comments?
    return @user.comments.size > 0
  end

  def has_favorites?
    return @user.favorites.size > 0
  end
  
end
