class Song

attr_reader :title, :artist
attr_accessor :isPlayed  

def initialize(title,artist,isPlayed = false)
	@title = title 
	@artist = artist
	@isPlayed = isPlayed
end 


end 