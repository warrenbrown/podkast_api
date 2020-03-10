class Api::V1::PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :update, :destroy]

  # GET /podcasts
  def index
    @podcasts = Podcast.all

    render json: @podcasts
  end

  # GET /podcasts/1
  def show
    render json: @podcast
  end

  # POST /podcasts
  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      render json: @podcast, status: :created, location: @podcast, message: 'Podcast Created!'
    else
      render json: @podcast.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /podcasts/1
  def update
    if @podcast.update(podcast_params)
      render json: @podcast
    else
      render json: @podcast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /podcasts/1
  def destroy
    @podcast.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def podcast_params
      params.require(:podcast).permit(:title, :description, :image_url)
    end
end
