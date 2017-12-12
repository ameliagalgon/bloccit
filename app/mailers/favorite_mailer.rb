class FavoriteMailer < ApplicationMailer
  default from: "agalgon@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@nameless-island-88424>"
    headers["In-Reply-To"] = "<post/#{post.id}@nameless-island-88424>"
    headers["References"] = "<post/#{post.id}@nameless-island-88424>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post, user)
    headers["Message-ID"] = "<post/#{post.id}@nameless-island-88424>"
    headers["In-Reply-To"] = "<post/#{post.id}@nameless-island-88424>"
    headers["References"] = "<post/#{post.id}@nameless-island-88424>"

    @user = user
    @post = post

    mail(to: user.email, subject: "You've favorited #{post.title}")
  end

end
