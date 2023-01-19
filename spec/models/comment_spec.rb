require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Comment should be valid' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'Helloo', text: 'Joey doesn\'t share food.')
    comment =  Comment.create(author: user, post: post, text: 'Twisted gammmesssssss!')
    expect(comment).to be_valid
  end

  it 'Comment_counter on Post should equal 1' do 
    user = User.create(name: 'Sombody', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im a Jhon Doe')
    post = Post.create(author: user, title: 'Helloo', text: 'Joey doesn\'t share food.')
    comment =  Comment.create(author: user, post: post, text: 'Twisted gammmesssssss!')
    post = Post.find(post.id)
    expect(post.comments_counter).to eq 1
  end
end
