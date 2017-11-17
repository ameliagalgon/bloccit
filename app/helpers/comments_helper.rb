module CommentsHelper
     def user_is_authoized_for_comment?(comment)
          current_user && (current_user == comment.user || current_user.admin?)
     end
end
