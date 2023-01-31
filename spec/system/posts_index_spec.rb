require 'rails_helper'

RSpec.describe "PostsIndices", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do 
    hayet = User.create(name: 'Hayet', photo: 'https://i.pinimg.com/564x/51/7f/f7/517ff77139fd2e804468e534b806cc7c.jpg', bio: 'My cats are cute.')
    post1 = Post.create(author: hayet, title: 'I love my cats', text: "Lorem Ipsum is simply dummy 
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
 
    post2 = Post.create(author: hayet, title: 'Cats are taking over the world', text: "Lorem Ipsum is simply dummy 
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")

    visit user_posts_path(hayet.id)
  end

  it "loads the user's name" do 
    expect(page).to have_content("Hayet")
  end

  it "loads the number of posts by the user" do 
    expect(page).to have_content("2 posts")
  end 


  it "loads the posts container" do 
    expect(page).to have_css("div[class='posts-container']")
  end 

  it "redirects you to the new post form" do 
    click_link("Create new Post", exact: true)
    expect(page).to have_current_path(new_user_post_path(User.all.first.id))
  end
end
