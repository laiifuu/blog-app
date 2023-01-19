require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Like should be valid' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'idk again', text: 'Joey doesn\'t share food.')
    like = Like.create(author: user, post:)
    expect(like).to be_valid
  end

  it 'Post\'s likesCounter should equal 1' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'idk again', text: 'Joey doesn\'t share food.')
    Like.create(author: user, post:)
    post = Post.find(post.id)
    expect(post.likes_counter).to eq 1
  end
end
