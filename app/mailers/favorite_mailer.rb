class FavoriteMailer < ApplicationMailer
  default from: "agalgon@gmail.com"
  default cc: "caila.blanton@bloc.io"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@nameless-island-88424>"
    headers["In-Reply-To"] = "<post/#{post.id}@nameless-island-88424>"
    headers["References"] = "<post/#{post.id}@nameless-island-88424>"

    @user = user
    @post = post
    @comment = comment

    mail(to: "ameliagalgon@gmail.com", subject: "New comment on #{post.title}")
  end
end
