require("pry")
require_relative("../models/albums")
require_relative("../models/artists")

artist1 = Artist.new({'name' => 'Adele'})

album1 = Album.new({
  'title' => 'Dancing Queen',
  'genre' => 'pop'
  'artist_id' => artist1.id
  })
