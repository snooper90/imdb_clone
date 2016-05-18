class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @movie.update_attributes(movie_params)
        format.html { redirect_to @movie, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def index
    @movies = Movie.all
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :summary, :embed_link, :thumbnail)
  end
  def set_movie
    @movie = Movie.find(params[:id])
    if !@movie
      redirect_to new_profile_path and return
    end
  end

end
