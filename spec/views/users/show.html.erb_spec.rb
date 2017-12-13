require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:post) { create(:post, user_id: another_user.id) }

  it "displays user favorites" do
    assign(:user, [
      stub_template(:id => user.id),
    ])
    Favorite.create(post_id: post.id, user_id: user.id)

    expect(view).to render_template(:partial => "_post", :locals => { :post => post } )
  end

end
