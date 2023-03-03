require_relative '../classes/MusicAlbum/music_album'
require 'date'
describe MusicAlbum do
  before :each do
    @date = Date.parse '2023/03/10'
    @musics = MusicAlbum.new(true, @date, true)
  end
  context 'given arguments' do
    it 'is an object of MusicAlbum ' do
      expect(@musics).to be_an_instance_of(MusicAlbum)
    end
    it 'has the given data ' do
      expect(@musics).to have_attributes(on_spotify: true, publish_date: @date, archived: true)
    end
    it 'on_spotify should be true' do
      expect(@musics.on_spotify).to be true
    end
  end
end
