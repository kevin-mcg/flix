class MoviesController < ApplicationController
  def index
    # No future films will be shown FYI
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "Successfully updated!"
      redirect_to movie_path(@movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Successfully created!"
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to @movie, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).
            permit(:title, :description, :rating, :released_on, :total_gross,
                                  :director, :duration, :image_file_name)
  end
end
