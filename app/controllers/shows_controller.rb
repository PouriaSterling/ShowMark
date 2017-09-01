class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end
  
  # def search_tmdb
  #   res = Tmdb::Search.tv(params[:search_terms])
    
  #   # no results
  #   if res.total_results == 0
  #     flash[:warning] = 'Show not found'
  #     redirect_to new_show_path
  #   else
  #     # @show = Show.new(name: res.results[0].name)
  #     # if @show.save
  #     #   format.html { redirect_to @show, notice: 'Show was successfully created.' }
  #     #   format.json { render :show, status: :created, location: @show }
  #     # else
  #     #   format.html { render :new }
  #     #   format.json { render json: @show.errors, status: :unprocessable_entity }
  #     # end
  #     redirect_to create
  #   end
  # end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)
    # byebug
    res = Tmdb::Search.tv(@show.name)
    # no results
    if res.total_results == 0
      flash[:warning] = 'Show not found'
      render 'new' and return
    end
    # set show name from TMDb result
    @show.name = res.results[0].name
    byebug
    
    if @show.save
      flash[:notice] = 'Show successfully created'
      redirect_to shows_path and return
    else
      flash[:warning] = 'Show not found'
      render 'new' 
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
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

  # DELETE /shows/1
  # DELETE /shows/1.json
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
      params.require(:show).permit(:name, :season, :episode)
    end
end
