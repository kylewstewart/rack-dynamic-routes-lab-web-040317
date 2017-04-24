class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.find_by_name(name)
    self.all.find{|item| item.name == name}
  end

  def self.all
    @@items
  end
end
