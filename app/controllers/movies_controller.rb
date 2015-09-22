class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end
end

  # get 'movies/index'

  # get 'movies/show'

  # get 'movies/new'

  # get 'movies/edit'