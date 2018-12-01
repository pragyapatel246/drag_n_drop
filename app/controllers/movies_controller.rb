class MoviesController < ApplicationController

 def index
   @movies = Movie.all
 end

 def new
   @movie = Movie.new
   @photo = @movie.photos.build
 end

 def create
   @movie = Movie.new(params_movie)
   @movie.save
   if  params[:photos].present?
    params[:photos]['pic'].each do |i|
    @photo = @movie.photos.create!(:pic => i)
    end
  end
  redirect_to movies_path, notice: ' successfully created.'
end

def edit
 @movie = Movie.find(params[:id])
end

def update
  @movie = Movie.find(params[:id])
  if @movie.update(params_movie)
    if  params[:photos].present?
      @movie.photos.delete_all
      params[:photos]['pic'].each do |i|
        @photo = @movie.photos.create!(:pic => i)
      end
    end
  end
  redirect_to movies_path, notice: ' successfully created.'
end

def show
 @movie = Movie.find(params[:id])
end

def destroy
 @movie = Movie.find(params[:id])
 @movie.destroy
 redirect_to movies_path
end

def params_movie
 params.require(:movie).permit(:name, :avatar, {images: []}, photos_attributes:[:id,:pic,:movie_id] )
end
end
