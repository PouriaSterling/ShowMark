class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @shows = Show.all
  end

  def show
  end

  def new
    @show = Show.new
  end
  
  def search_tmdb
    @name = params[:search_terms]
    @search = 0
    if !@name.blank?
      @search = Tmdb::Search.tv(@name)
    end
    @config = Tmdb::Configuration.get
    @base_url = @config.images.base_url
    @poster_size = @config.images.poster_sizes[0]
  end
  
  def search_id
    @id = params[:id]
    @show = Tmdb::TV.detail(@id)
    @seasons = @show.number_of_seasons
    @offset = 0
    # skip season 0 (special episodes) if it exists
    if @show.seasons[0].season_number == 0
      @offset = 1
    end
    @show.seasons.reverse_each do |season|
      if !Date.parse(season.air_date).past?
        @seasons -= 1
      end
    end
  end
  
  def get_ep
    @id = params[:id]
    @season = params[:season]
    @episodes = params[:ep]
  end
  
  def get_ep_info
    @id = params[:id]
    @season = params[:season]
    @ep = params[:ep]
    @episode = Tmdb::Tv::Episode.detail(@id, @season, @ep)
    @stills = Tmdb::Tv::Episode.posters(@id, @season, @ep)
    @details = Tmdb::TV.detail(@id)
    @name = @details.name
    
    @config = Tmdb::Configuration.get
    @base_url = @config.images.base_url
    @still_size = @config.images.still_sizes[2]
    
    @show = Show.new(name: @name, season: @season, episode: @ep)
  end

  def edit
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = 'Show successfully created'
      redirect_to shows_path and return
    else
      flash[:warning] = 'Failed to add show'
      render 'new' 
    end
  end

  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      if params[:show].blank?
        raw_parameters = {
          show: {
            name: params[:name],
            season: params[:season],
            episode: params[:episode]
          }
        }
        params = ActionController::Parameters.new(raw_parameters)
      end
      params.require(:show).permit(:name, :season, :episode)
    end
end
