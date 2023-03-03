require_relative '../classes/MusicAlbum/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Gospel')
  end
  context 'given one argument' do
    it 'is an object of Genre ' do
      expect(@genre).to be_an_instance_of(Genre)
    end
    it 'has the given data ' do
      expect(@genre).to have_attributes(name: 'Gospel')
    end
  end
end
