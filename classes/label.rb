require 'json'
require_relative 'title'

class Label
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
  
  def save
    File.open('labels.json', 'a') do |file|
      file.puts JSON.generate(to_h)
    end
  end

  def to_h
    {
      name: @name,
      items: @items.map(&:to_h)
    }
  end

  def self.all
    labels = []
    File.open('labels.json', 'r') do |file|
      file.each_line do |line|
        label_data = JSON.parse(line, symbolize_names: true)
        label_data = new(label_data[:name])
        label_data[:items].each do |item_data|
          item = Item.new(item_data[:item], item_data[:description])
          item.label = label
          label.add_item(item)
        end
        labels << label
      end
    end
    labels
  end
end
