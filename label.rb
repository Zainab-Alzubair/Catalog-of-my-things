require 'json'
class Label
    attr_accessor :name, :items
    
    def initialize(name)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        item.label= self
    end
end