require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do 
    hayet = User.create(name: 'Hayet', photo: 'https://i.pinimg.com/564x/51/7f/f7/517ff77139fd2e804468e534b806cc7c.jpg', bio: 'My cats are cute.')
    post1 = Post.create(author: hayet, title: 'I love my cats', text: "Lorem Ipsum is simply dummy 
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
 
    post2 = Post.create(author: hayet, title: 'I love my cats', text: "Lorem Ipsum is simply dummy 
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
    
    post3 = Post.create(author: hayet, title: 'I love my cats', text: "Lorem Ipsum is simply dummy 
    text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 
    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")

    visit user_path(hayet.id)
  end

  it "loads Hayet's personal page" do
    expect(page).to have_content('Hayet')
  end

  it "loads Hayet's posts page with 3 posts" do
    posts = page.all(class:['post-card'])
    expect(page).to have_content('3 posts')
    expect(posts.length).to eq 3
  end

  it "loads Hayet's personal page including the Bio" do
    expect(page).to have_content("Bio")
    expect(page).to have_content("My cats are cute.")
  end

  it "loads Hayet's personal page including the profile picture" do
    expect(page).to have_css("img[src='https://i.pinimg.com/564x/51/7f/f7/517ff77139fd2e804468e534b806cc7c.jpg']")
    expect(page).to have_css("img[class='profile-picture']")
  end

  it "loads Hayet's personal page including the show all posts button" do
    expect(page.has_button?("Show all posts")).to eq true
  end

  it "redirects you to Hayet's posts page" do
    click_link("Show all posts", exact: true)
    expect(page).to have_current_path(user_posts_path(User.all.first.id))
  end
end
