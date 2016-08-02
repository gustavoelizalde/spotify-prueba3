class UserSongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
  	@mysongs = UserSong.all
  end

  def new
  	@my_song = UserSong.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @my_song.song = @song
    @my_song.user = current_user

    respond_to do |format|
      if @my_song.save
        format.html { redirect_to @my_song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @my_song }
      else
        format.html { render :new }
        format.json { render json: @my_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @my_song.update(usersong_params)
        format.html { redirect_to @my_song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_song }
      else
        format.html { render :edit }
        format.json { render json: @my_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @my_song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = UserSong.find(params[:song_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usersong_params
      #params.require(:song).permit(:song_id)
    end
end
