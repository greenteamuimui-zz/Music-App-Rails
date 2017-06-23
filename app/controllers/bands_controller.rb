class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band
      @band.update_attributes(name:params[:name])
    else
      flash.now[:errors] = ["Can not find band!"]
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
      render :index
    else
      flash.now[:errors] = ["Can not find band!"]
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
