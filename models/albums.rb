require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Albums

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @title = options['title']
    @genre = options['genre']
  end

end
