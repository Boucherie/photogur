class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      #if the picture is saved generate a get request the '/pictures' (the index)
      redirect_to "/pictures"
    else
      #otherwise render new.html.erb
      render :new
    end
  end

  def picture_params
    { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end
end
