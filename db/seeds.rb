require 'csv'

SONG_FILE = Rails.root.join('db', 'song_seeds.csv')
puts "Loading raw songs data from #{SONG_FILE}"

song_failures = []
CSV.foreach(SONG_FILE, :headers => true) do |row|
  song = Song.new
  song.title = row['title']
  song.artist = row['artist']
  song.year = row['year'].to_i
  successful = song.save
  if !successful
    song_failures << song
    puts "Failed to save song: #{song.inspect}"
  else
    puts "Created song: #{song.inspect}"
  end
end

puts "Added #{Song.count} song records"
puts "#{song_failures.length} songs failed to save"