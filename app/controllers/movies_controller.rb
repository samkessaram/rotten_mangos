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

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

#   <%= form_tag(movies_search_path) do %>
#   <%= label_tag(:title, "Title:") %>
#   <%= text_field_tag(:title) %>
#   <%= label_tag(:director, "Director:") %>
#   <%= text_field_tag(:director) %>
#   <%= label_tag(:duration, "Duration:") %>
#   <%= select_tag :duration, "<option value></option><option value='<90'>Less than 90 minutes</option><option value='90..120'>90 to 120 minutes</option><option value='>120'>More than 120 minutes</option>".html_safe %>
#   <%= submit_tag("Search") %>
# <% end %>

  def search

    @results = Movie.where("title like ?", "%#{params[:title]}%")

  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :poster_image, :description
    )
  end

end