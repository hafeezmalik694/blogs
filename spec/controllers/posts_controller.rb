require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # Use Devise test helpers
  include Devise::Test::ControllerHelpers

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  before do
    @post = Post.create(title: 'Test Title', content: 'Test Content', user: User.first)
  end

  describe 'GET #index' do
    it 'should get index' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to be_present
    end
  end

  describe 'POST #create' do
    it 'should create a new post' do
      expect {
        post :create, params: { post: { title: 'Test Title', content: 'Test Content' } }
      }.to change(Post, :count).by(1)
      
      expect(response).to redirect_to(assigns(:post))
      expect(Post.last.title).to eq('Test Title')
    end
  end
end
