class MoviesController < ApplicationController
  before_action :set_movie, only: :show

  def show
    render json: @movie
  end

  def create
    @category = Category.where(name: movie_params[:category]).first

    @movie = Movie.new(movie_params.except(:category))
    @movie.category = @category

    if @movie.already_in_db
      render json: @movie.errors, status: :not_modified
    elsif @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :year, :poster, :category)
    end
end
