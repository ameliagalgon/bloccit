require 'pry'
require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:post) { create(:post, user_id: another_user.id, title: "My Favorite Post Title") }

  it "displays user favorites" do
    Favorite.create!(post_id: post.id, user_id: user.id)
    render :partial => "posts/post.html.erb", :locals => { :post => post }
    expect(rendered).to include("My Favorite Post Title")
  end

end
