class MusicIndicationsController < ApplicationController
  def new
    @music_indication = MusicIndication.new
  end

  def create
   @music_indication = MusicIndication.new(music_indication_params)

   if @music_indication.save
     redirect_to root_path
   else
     render :new
   end
 end

  private

  def music_indication_params
    params.require(:music_indication).permit(:song_name, :artist_name)
  end
end

