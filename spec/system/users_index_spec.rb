require 'rails_helper'

RSpec.describe "Users", type: :system do
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

    visit root_path
  end

  it "loads the users page containing the username Hayet" do 
    expect(page).to have_content('Hayet')
  end 


  it "loads the users page with the user Hayet who has 3 posts" do 
    expect(page).to have_content('3 posts')
  end 

  it "loads the users page with the user Hayet including a profile picture" do 
    expect(page).to have_css("img[src='https://i.pinimg.com/564x/51/7f/f7/517ff77139fd2e804468e534b806cc7c.jpg']")
    expect(page).to have_css("img[class='profile-picture']")
  end 

  it "redirects to a user's posts page after clicking on the user 
  (users#show)" do
    click_on "Hayet"
    expect(page).to have_content("Bio")
  end
end
