require 'spec_helper'

describe Playlist do 

before :all do
  @playlist = Playlist.new 


  @playlist.add_song(Song.new("Ride the Lightning", "Metallica"))
  @playlist.add_song(Song.new("Licensed to Ill", "Beastie Boys"))
  @playlist.add_song(Song.new("Pauls Boutique", "Beastie Boys"))
  @playlist.add_song(Song.new("The Dark Side of the Moon","Pink Floyd"))

end

it "add 4 different songs to playlist collection" do 
  expect(@playlist.collection.length).to eq(4)
end 

 it "list all songs via there artists in the playlist" do 
   expect(@playlist.list_all_songs_and_artists(nil,String)).to eq("Ride the Lightning by Metallica (unplayed)\nLicensed to Ill by Beastie Boys (unplayed)\nPauls Boutique by Beastie Boys (unplayed)\nThe Dark Side of the Moon by Pink Floyd (unplayed)\n")
 end 

it "play a couple of songs" do 
  expect(@playlist.play_song("Ride the Lightning")).to eq("You're listening to Ride the Lightning")
  expect(@playlist.play_song("Licensed to Ill")).to eq("You're listening to Licensed to Ill")
end 

it "play a song that does not exist in the playlist" do 
  expect(@playlist.play_song("Cry me a river")).to eq("There is no song in the playlist with that name!")
 end 

it "list all unplayed songs via there artists in the playlist" do 
   @playlist.list_all_songs_and_artists(true,String)
   expect(@playlist.list_all_songs_and_artists(true,String)).to eq("Pauls Boutique by Beastie Boys \nThe Dark Side of the Moon by Pink Floyd \n")
end 

it "show all songs by a specific artist" do 
  expect(@playlist.list_all_songs_and_artists(nil, "Beastie Boys")).to eq("Licensed to Ill by Beastie Boys (played)\nPauls Boutique by Beastie Boys (unplayed)\n")
end 

it "show all unplayed songs by a specific arist" do 
  expect(@playlist.list_all_songs_and_artists(true, "Beastie Boys")).to eq("Pauls Boutique by Beastie Boys \n")
end 

it "song doesn't exist by artist" do 
  expect(@playlist.list_all_songs_and_artists(true, "Michael Jackson")).to eq ("There isn't any songs by this artist!")
end

end 