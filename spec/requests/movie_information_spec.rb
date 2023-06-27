require 'rails_helper'

RSpec.describe "MovieInformations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/movie_information/index"
      expect(response).to have_http_status(:success)
    end
  end

end
