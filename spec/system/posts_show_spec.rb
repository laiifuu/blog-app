require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    hayet = User.create(name: 'Hayet',
                        photo: 'https://i.pinimg.com/564x/51/7f/f7/517ff77139fd2e804468e534b806cc7c.jpg',
                        bio: 'My cats are cute.')
    post1 = Post.create(author: hayet, title: 'I love my cats', text: "Lorem Ipsum is simply dummy
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled
    it to make a type specimen book.")

    Comment.create(author: hayet, post: post1, text: 'This is the first comment on this post.')
    visit user_post_path(hayet.id, post1.id)
  end

  it "loads the post's title" do
    expect(page).to have_content('I love my cats')
  end

  it "loads the post's body" do
    expect(page).to have_content('Lorem Ipsum is simply dummy text ')
  end

  it "loads the post's owner (author)" do
    expect(page).to have_content('by Hayet')
  end

  it "loads the post's comments count" do
    expect(page).to have_content('Comments: 1')
  end

  it "loads the post's likes count" do
    expect(page).to have_content('Likes: 0')
  end

  it "should show for each comment, the commentator's name and his comment" do
    expect(page).to have_css("div[class='comment']")
    expect(page).to have_css("span[class='comment-author']")
    expect(page).to have_css("span[class='comment-text']")
  end

  it 'After clicking on the like post button, the likes counter should increase by 1' do
    click_button('Like Post')
    expect(page).to have_content('Likes: 1')
  end
end
