require 'rspec'
require_relative '../classes/labels/label'
require_relative '../classes/title'

describe Label do
  label = Label.new('Comedy', 'Red')

  describe '#new' do
    it 'takes two parameters and returns a Label object' do
      expect(label).to be_a Label
    end
  end

  describe '#Title' do
    it 'returns the correct title' do
      expect(label.title).to eq('Comedy')
    end
  end

  describe '#Color' do
    it 'returns the correct color' do
      expect(label.color).to eq('Red')
    end
  end

  describe 'Add items to label'
  it 'Push a new item in Each label class object' do
    item = Item.new(Time.new(2010, 1, 1), true, 10)
    label.add_items(item)

    expect(label.items).to include(item)
  end
end
