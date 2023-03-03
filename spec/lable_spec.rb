require './classes/title'
require './classes/lable'

RSpec.describe Lable do
  let(:item) { Item.new("2022-03-01", false, 1) }
  subject(:lable) { Lable.new(1, 'My Lable', 'Gray') }

  describe "#initialize" do
    it "should set the id, title and color" do
      expect(lable.id).to eq(1)
      expect(lable.title).to eq('My Lable')
      expect(lable.color).to eq('Gray')
      expect(lable.items).to eq([])
    end
  end

  describe "#add_item" do
    it "should add the input item to the collection of the items" do
      lable.add_item(item)
      expect(lable.items).to include(item)
    end
  end
end
