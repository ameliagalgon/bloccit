class Vote < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  after_save :update_post
  #invlusion validation ensures that value is assigned iether a -1 or 1
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true

  private

  def update_post
    post.update_rank
  end

end
