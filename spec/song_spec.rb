require 'spec_helper'

describe Song do

before :each do
  @song = Song.new "Ride the Lightning", "Metallica", false
end

it "takes three parameters and returns a Song object" do
	expect(@song).to be_a Song
end
 
it "title parameter is of type string" do 
	expect(@song.title).to be_a String
end 

it "artist parameter is of type string" do 
	expect(@song.artist).to be_a String
end 

it "isPlayed parameter is of type boolean" do 
	expect(@song.isPlayed).to eq(false) 
end 

it "isPlayed is updated to a parameter of true" do 
	@song.isPlayed = true 
	expect(@song.isPlayed).to eq(true)
end 


end