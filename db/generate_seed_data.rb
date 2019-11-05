require "faker"
require "csv"

CSV.open("db/song_seeds.csv", "w", :write_headers => true,
  :headers => ["title", "artist", "year"]) do |csv|
    50.times do
      title = Faker::Music.album
      artist = Faker::Music.band
      year = rand(1990..2019)
      
      csv << [title, artist, year]
    end
end