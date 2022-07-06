require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:movie) { create(:movie) }

  it 'should create a valid instance of Movie' do
    expect(movie).to be_valid
  end

  it 'should belong to a category' do
    expect(movie.category).to be_truthy
  end

  context 'poster attribut' do
    it 'can be blank' do
      movie.poster = ""
      movie.save
      expect(movie).to be_valid
    end

    it 'should start with http or https' do
      movie.poster = "test.https"
      expect(movie.save).to be_falsy
    end
  end
end
