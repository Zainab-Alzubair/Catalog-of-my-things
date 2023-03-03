require 'json'
require_relative 'title'

class Lable
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.lable = self
  end

  def save
    File.open('lables.json', 'a') do |file|
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
    lables = []
    File.open('lables.json', 'r') do |file|
      file.each_line do |line|
        lable_data = JSON.parse(line, symbolize_names: true)
        lable_data = new(lable_data[:name])
        lable_data[:items].each do |item_data|
          item = Item.new(item_data[:item], item_data[:description])
          item.label = label
          lable.add_item(item)
        end
        lables << label
      end
    end
    lables
  end
end
