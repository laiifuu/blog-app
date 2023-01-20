require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Post should be invalid' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: '', text: 'Joey doesn\'t share food.')
    expect(post).to_not be_valid
  end

  it 'Post should be invalid' do
    text255 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa11111111111111111s111111aaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: text255, text: 'Sorry for your ears m8')
    expect(post).to_not be_valid
  end

  it 'User\'s postsCounter should equal 1' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    Post.create(author: user, title: 'idk again', text: 'Joey doesn\'t share food.')
    user = User.find(user.id)
    expect(user.posts_counter).to eq 1
  end

  it 'Post\'s likesCounter should equal 0' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'idk again', text: 'Joey doesn\'t share food.')
    expect(post.likes_counter).to eq 0
  end

  it 'post\'s commentsCounter should equal 0' do
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'idk again', text: 'Joey doesn\'t share food.')
    expect(post.comments_counter).to eq 0
  end
end
