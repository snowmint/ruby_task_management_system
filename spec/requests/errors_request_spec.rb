require 'rails_helper'

RSpec.describe "Errors", type: :request do

  describe "GET /not_found" do
    it "returns http success" do
      get "/errors/not_found"
      expect(response.status).to eq(404)
    end
  end

  describe "GET /internal_server_error" do
    it "returns http success" do
      get "/errors/internal_server_error"
      expect(response.status).to eq(500)
    end
  end

end
