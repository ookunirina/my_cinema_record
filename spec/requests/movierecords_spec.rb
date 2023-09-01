require 'rails_helper'

RSpec.describe 'Movierecords', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/movierecords/index'
      expect(response).to have_http_status(:success)
    end
  end
end
