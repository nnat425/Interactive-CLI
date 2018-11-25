require './lib/song'
require './lib/playlist'
require './helper/error_checker'

puts 'Welcome to your music collection!'
playlist = Playlist.new 

while (command = gets.chomp.strip) != 'quit'

  split_command_array = command.scan(/(?:\w|"[^"]*")+/)

   begin 
    if split_command_array[0] == 'add' &&  !split_command_array[1].undump.nil? &&  !split_command_array[2].undump.nil? && split_command_array.length == 3
      puts playlist.add_song(Song.new(split_command_array[1],split_command_array[2]))
    elsif split_command_array[0] == 'show' && split_command_array[1] == 'all' && split_command_array.length == 2
      puts playlist.list_all_songs_and_artists(nil, String)
    elsif split_command_array[0] == 'show' && split_command_array[1] == 'all' &&  split_command_array[2] == 'by' && !split_command_array[3].undump.nil? && split_command_array.length == 4
      puts playlist.list_all_songs_and_artists(nil,split_command_array[3])
    elsif split_command_array[0] == 'show' && split_command_array[1] == 'unplayed' &&  split_command_array[2] == 'by' && !split_command_array[3].undump.nil? && split_command_array.length == 4
      puts playlist.list_all_songs_and_artists(true,split_command_array[3])
    elsif split_command_array[0] == 'show' && split_command_array[1] == 'unplayed' && split_command_array.length == 2
      puts playlist.list_all_songs_and_artists(true, String)
    elsif split_command_array[0] == 'play' && !split_command_array[1].undump.nil? && split_command_array.length == 2
      puts playlist.play_song(split_command_array[1])
    else 
      ErrorChecker.command_validation_check(split_command_array[0])
    end 
  rescue
    puts "Please put quotes around the song title/artist!"
  end 
end


if command == 'quit'
  puts 'Bye!'
end 