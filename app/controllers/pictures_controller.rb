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
    params.require(:picture).permit(:name, :artist, :title, :url)
  #{title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def updated_at
    @picture = Picture.find(params[:id])
    #use the same picture_params method we used in created
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

end
