require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  describe "Posts  controller testing" do
    it "GET /users/:id/posts" do
      get "/users/:239/posts"
      expect(response).to have_http_status(:ok)  
      expect(response).to render_template('posts/index')
      expect(response.body).to include("<h1>This is the view to show all the posts for a specific user</h1>")
    end

    it "GET /users/:id/posts/:id" do
      get "/users/239/posts/178"
      expect(response).to have_http_status(:ok)  
      expect(response).to render_template('posts/show')
      expect(response.body).to include("<h1>View to show a single post</h1>")
    end
  end
end
