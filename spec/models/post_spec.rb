require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) {Topic.create!(name: name, description: description) }

  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: title, body: body, user: user) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }


  describe "attributes" do
      it "has title, body and user attributes" do
          expect(post).to have_attributes(title: title, body: body, user: user)
      end
  end

  describe "scopes" do
    let(:post_one){ topic.posts.create!(title: "AAAAA", body: RandomData.random_paragraph, user: user, created_at: Time.new(2000,1,1)) }
    let(:post_two){ topic.posts.create!(title: "ZZZZZ", body: RandomData.random_paragraph, user: user, created_at: Time.new(2017,1,1)) }

    it "orders by descending created at date by default" do
      expect(Post.all).to eq [post_two, post_one]
    end

    it "ordered_by_title orders posts by title" do
      expect(Post.unscoped{Post.ordered_by_title.all}).to eq [post_one, post_two]
    end

    it "ordered_by_reverse_created_at orders posts by reverse created at date" do
      expect(Post.unscoped{Post.ordered_by_reverse_created_at.all}).to eq [post_one, post_two]
    end
  end
end
