class Playlist 

attr_reader :collection

  def initialize 
    @collection = []
  end 

  def add_song(song)
  	return "Cannot add this song. There is a song with the same title already! Please add a song with a different title!" if does_song_exist_in_playlist(song) == true 
  	@collection << song 
  	return "Added " + song.title + " by " + song.artist.delete_prefix('"').delete_suffix('"')
  end 

  def list_all_songs_and_artists(unplayed_or_played_song, artist)
    return "There are no songs in the playlist! Please add some songs!"  if is_playlist_empty? 
    return "There aren't any unplayed songs!" if is_there_unplayed_songs? && unplayed_or_played_song == true  
    return "There isn't any songs by this artist!" if is_there_song_by_artist?(artist) == false && artist != String 

    output_string = ''
  	@collection.select do |song| 
      if song.isPlayed != unplayed_or_played_song && artist === song.artist 
        output_string += song.title + " by " + song.artist.delete_prefix('"').delete_suffix('"') + ' ' + is_song_unplayed(song,unplayed_or_played_song) + "\n"
      end 
    end 
    return output_string
  end

  def play_song(song_title)
    @collection.each do |song|   
      if song_title == song.title
        song.isPlayed = true
        return "You're listening to ".delete_prefix('"').delete_suffix('"') + song_title
      end 
    end
    return "There is no song in the playlist with that name!"
  end  

  def is_song_unplayed(song,show_for_all)
    return '' if show_for_all != nil
    song.isPlayed ?  '(played)' :  '(unplayed)'
  end 

  def does_song_exist_in_playlist(potential_newly_created_song)
   duplicate_song_array =  @collection.select { |song| song.title.downcase == potential_newly_created_song.title.downcase }
     if !duplicate_song_array.empty?
       return true 
     end 
  end 

  def is_playlist_empty?
    return @collection.empty?
  end 

  def is_there_unplayed_songs? 
    unplayed_songs = @collection.all? { |song| song.isPlayed == true }
    return true if unplayed_songs == true
  end 

  def is_there_song_by_artist?(artist)
    does_artist_exist = @collection.any? { |song| artist == song.artist }
    return false if does_artist_exist == false 
  end  

end 