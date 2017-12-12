require 'pry'
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) {Comment.create!(body: "Comment Body", post: post, user: user)}

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }

  describe "attributes" do
      it "has a body attribute" do
          expect(comment).to have_attributes(body: "Comment Body")
      end
  end

  describe "after_create" do
    let(:another_user) { create(:user) }
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: another_user)
    end

    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      @another_comment.save!
      user_subjects = FavoriteMailer.deliveries.map do |m|
        { :email => m.to, :subject => m.subject }
      end

      expect(user_subjects).to include({ :email => [user.email], :subject => "New comment on #{post.title}"})
    end

    it "does not send emails to users who haven't favorited the post" do
      #expect(FavoriteMailer).not_to receive(:new_comment).with(another_user, post, @another_comment)
      expect(FavoriteMailer.deliveries.map(&:to)).not_to include([user.email])
      @another_comment.save!
    end
  end
end
