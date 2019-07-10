require("pry")
require_relative("../models/albums.rb")
require_relative("../models/artists.rb")

artist1 = Artist.new({'name' => 'Adele'})
artist1.save()

artist2 = Artist.new({'name' => 'Madonna'})
artist2.save()

album1 = Albums.new({
  'title' => 'Dancing Queen',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

  album2 = Albums.new({
    'title' => 'Ray of Light',
    'genre' => 'pop',
    'artist_id' => artist2.id
    })

binding.pry
nil
