require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  it 'GET api/v1/posts' do
    get user_api_v1_posts_path(1)
    expect(response).to have_http_status(:ok)
  end

  it 'GET api/v1/posts' do
    get user_api_v1_posts_path(1, 1)
    expect(response).to have_http_status(:ok)
  end

  # it 'GET api/v1/posts' do
  #   post user_api_v1_posts_path(1)
  #   expect(response).to have_http_status(:ok)
  # end
end
