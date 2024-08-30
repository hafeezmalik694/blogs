require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) } # Create a valid user using FactoryBot

  it 'is valid with valid attributes' do
    post = Post.new(title: 'Test Title', content: 'Test Content', user: user)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil, content: 'Test Content', user: user)
    expect(post).to_not be_valid
  end

  it 'is not valid without content' do
    post = Post.new(title: 'Test Title', content: nil, user: user)
    expect(post).to_not be_valid
  end
end
