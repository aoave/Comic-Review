class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @comics = Comic.all
  end


  def show
  end


  def new
    # this is good!
    @comic = current_user.comics.build
  end


  def edit
  end


  def create
    @comic = current_user.comics.build(comic_params)

    # I'd remove this until you actually have a use for your app to be an API
    # I'd also suggest against using scaffold generator until you've built ~4
    # rails apps by hand
    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_comic
      @comic = Comic.find(params[:id])
    end


    def comic_params
      params.require(:comic).permit(:title, :desrciption, :photo_url)
    end
end
