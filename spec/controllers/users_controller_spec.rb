require 'rails_helper'

RSpec.describe UsersController, type: :controller do
     let(:new_user_attributes) do
          {
               name: "BlocHead",
               email: "blochead%bloc.io",
               password: "blochead",
               password_confirmation: "blochead"
          }
     end

     describe "GET new" do
          it "returns http success" do
               get :new
               expect(response).to have_http_status(:success)
          end

          it "instantiates a new user" do
               get :new
               expect(assigns(:user)).to_not be_nil
          end
     end

     describe "POST create" do
          it "returns an http redirect" do
               post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               expect(response).to have_http_status(:redirect)
          end

          it "creates a new user" do
               expect{
                    post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               }.to change(User, :count).by(1)
          end

          it "sets user name properly" do
               post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               expect(assigns(:user).name).to eq new_user_attributes[:name]
          end

          it "sets user email properly" do
               post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               expect(assigns(:user).email).to eq new_user_attributes[:email]
          end

          it "sets user password properly" do
               post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               expect(assigns(:user).password).to eq new_user_attributes[:password]
          end

          it "sets user password_confirmation properly" do
               post :create, params: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}
               expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
          end
     end

     describe "POST confirm" do
          it "returns http success status" do
               get :confirm, params: {user: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}}
               expect(response).to have_http_status(:success)
          end

          it "renders new template when no name given" do
            get :confirm, params: {user: {name: "", email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}}
            expect(response).to redirect_to(new_user_path)
          end

          it "renders new template when no email given" do
            get :confirm, params: {user: {name: new_user_attributes[:name], email: "", password: new_user_attributes[:password], password_confirmation: new_user_attributes[:password_confirmation]}}
            expect(response).to redirect_to(new_user_path)
          end

          it "renders new template when no password is given" do
            get :confirm, params: {user: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: "", password_confirmation: new_user_attributes[:password_confirmation]}}
            expect(response).to redirect_to(new_user_path)
          end

          it "renders new template when no password confirmation is given" do
            get :confirm, params: {user: {name: new_user_attributes[:name], email: new_user_attributes[:email], password: new_user_attributes[:password], password_confirmation: ""}}
            expect(response).to redirect_to(new_user_path)
          end
     end
end
