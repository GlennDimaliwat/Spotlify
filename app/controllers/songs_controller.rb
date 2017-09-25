class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_color_scheme, only: [:show, :edit]

  # Retrieves Top 10 Songs played
  def top_10_songs
    # @play_count = PlayCount.all.group(:song_id).count #.order("count_all desc")
    # @play_count.each { |song_id, count|
    #   p song_id
    # }
    @songs = Song.top10
    # p @play_count
    # p @play_count.inspect
  end

  # Play a Song
  def play_song
    set_song
    set_color_scheme
    @play_count = PlayCount.new
    @play_count.song = @song
    @play_count.save
    
    # p @play_count
  end

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Set page color scheme
    def set_color_scheme
      
      # Color Scheme Variable
      @color_scheme = ""

      @song = Song.find(params[:id])
      year_category = @song.released_at.strftime("%Y")

      if year_category.starts_with?("198")
        @color_scheme = "eightees"

      elsif year_category.starts_with?("199")
        @color_scheme = "ninetees"

      elsif year_category.starts_with?("20")
        @color_scheme = "two_thousands"

      else
        @color_scheme = "default"

      end

    end

    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :artist_id, :duration, :released_at)
    end
end
