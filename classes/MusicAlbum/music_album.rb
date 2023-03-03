require_relative '../title'
require_relative '../MusicAlbum/genre_list'
require_relative '../MusicAlbum/music_list'
class MusicAlbum < Item
  attr_accessor :on_spotify, :genre
  attr_reader :id

  def initialize(on_spotify, publish_date, archived, id = Random.rand(1..1000))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
    @items = []
  end

  def to_json(*_args)
    {
      'id' => @id,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'genre_name' => @genre
    }
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
