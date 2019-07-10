require("pry")
require_relative("../models/albums.rb")
require_relative("../models/artists.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Adele'})
artist1.save()

artist2 = Artist.new({'name' => 'Madonna'})
artist2.save()

album1 = Album.new({
  'title' => 'Dancing Queen',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })
album1.save()

  album2 = Album.new({
    'title' => 'Ray of Light',
    'genre' => 'pop',
    'artist_id' => artist2.id
    })
    album2.save()

    album3 = Album.new({
      'title' => 'True Blue',
      'genre' => 'pop',
      'artist_id' => artist2.id
      })
      album3.save()



binding.pry
nil
