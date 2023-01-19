require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User should be invalid' do 
    user = User.create(name: '', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    expect(user).to_not be_valid
  end

  it 'User should be valid' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    expect(user).to be_valid
  end

  it 'User\'s postsCounter should equal 0' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    expect(user.posts_counter).to eq 0
  end

  it 'User shouldn\'t have any posts' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    expect(user.recent_posts.length).to eq 0
  end

  it 'User\'s most recent post should be Post 4' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'Post 1', text: 'Joey doesn\'t share food.')
    post = Post.create(author: user, title: 'Post 2', text: 'And that ladies and gents is how you get away from all your troubles.')
    post = Post.create(author: user, title: 'Post 3', text: 'Joey still doesn\'t share food.')
    post = Post.create(author: user, title: 'Post 4', text: 'Lets do this.')
    expect(user.recent_posts[0].title).to eq 'Post 4'
  end  
end
