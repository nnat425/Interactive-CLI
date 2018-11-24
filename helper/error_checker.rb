module ErrorChecker 

def self.command_validation_check(command)
  command_hash = {
    'add' => 'Please use following format: add "$title" "$artist"',
    'play' => 'Please use the following format: play "$title"',
    'show' => 'Please pick the following formats: show all, show unplayed, show all by "$artist", or show unplayed by "$artist"',
    'wrong_command' => 'This is an invalid command. Please use either add, play, show, or quit.'
  }
  if(command_hash.key?(command))
    puts command_hash[command]
  else 
    puts command_hash['wrong_command']
  end 
end 

end 