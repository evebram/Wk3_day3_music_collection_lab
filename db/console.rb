require("pry")
require_relative("../models/albums.rb")
require_relative("../models/artists.rb")

artist1 = Artist.new({'name' => 'Adele'})
artist1.save()

# album1 = Album.new({
#   'title' => 'Dancing Queen',
#   'genre' => 'pop'
#   'artist_id' => artist1.id
#   })

binding.pry
nil
