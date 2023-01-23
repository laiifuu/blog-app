require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "Users controller testing" do
    it "GET /" do
      get "/"
      expect(response).to have_http_status(:ok)  
      expect(response).to render_template('users/index')
      expect(response.body).to include("<h1>View to show users</h1>")
    end

    it "GET /users/:id" do
      get "/users/239"
      expect(response).to have_http_status(:ok) 
      expect(response).to render_template('users/show') 
      expect(response.body).to include("<h1>This is a view to show a single user</h1>")
    end
  end
end
