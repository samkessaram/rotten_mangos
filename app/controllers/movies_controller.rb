class MoviesController < ApplicationController
  def index
    if params[:runtime_in_minutes]
      if params[:runtime_in_minutes] == '<90'
        value1 = 0
        value2 = 90
      elsif params[:runtime_in_minutes] == '90..120'
        value1 = 90
        value2 = 120
      else params[:runtime_in_minutes] == '>120'
        value1 = 120
        value2 = 1000
      end
    end
    if params[:title] || params[:director] || params[:runtime_in_minutes]
      @movies = Movie.where("title like ?", "%#{params[:title]}%").where("director like ?", "%#{params[:director]}%").where("runtime_in_minutes < #{value2} AND runtime_in_minutes > #{value1}")
    else
      @movies = Movie.all
    end
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
      :title, :release_date, :director, :runtime_in_minutes, :url, :poster_image, :description
    )
  end

end