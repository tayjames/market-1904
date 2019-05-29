class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if inventory.include?(item)
      @inventory.value
    else
    0
    end
  end

  def stock(name, quantity)
    @inventory[name] = quantity
  end
end
