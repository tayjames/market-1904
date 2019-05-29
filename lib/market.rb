class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendors(vendor)
    @vendors << vendor
  end

  def vendor_names
    a = @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    item_we_want = @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
    item_we_want
  end

  def sorted_item_list
    all_inventory = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq.sort
  end

  def total_inventory #need to figure out how to combine same items
    inventory = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten
    quantities = @vendors.map do |vendor|
      vendor.inventory.values
    end.flatten
    total_inventory = Hash[inventory.zip quantities] #first attempt
    #second attempt: Hash[inventory.each_with_object(nil).to_a] => {"Peaches"=>nil, "Tomatoes"=>nil, "Banana Nice Cream"=>nil, "Peach-Raspberry Nice Cream"=>nil}
    #third attempt: Hash[inventory.product([nil])] => {"Peaches"=>nil, "Tomatoes"=>nil, "Banana Nice Cream"=>nil, "Peach-Raspberry Nice Cream"=>nil}
  end

end
