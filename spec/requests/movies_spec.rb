require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let!(:movie) { create(:movie) }

  describe "GET /movies" do
    it "should work" do
      get movies_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /movies" do
    it 'should work when data are new to the database' do
      attributes = attributes_for(:movie)
      attributes[:category] = movie.category.name

      post movies_path, params: { movie: attributes }
      expect(response).to have_http_status(:success)
    end

    it 'should prevent writting data in database if record already exist' do
      post movies_path, params: { movie: movie.attributes}
      expect(response).to have_http_status(:not_modified)
    end

    it 'should throw error when Movie record is not valid' do
      post movies_path, params: { movie: attributes_for(:movie) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
