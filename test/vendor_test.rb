require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < MiniTest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_vendor_exists
    assert_instance_of Vendor, @vendor
  end

  def test_vendor_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    expected = {}
    assert_equal expected, @vendor.inventory
  end

  def test_check_stock
    assert_equal 0, @vendor.check_stock("Peaches")
    @vendor.stock("Peaches", 55)
    assert_equal 55, @vendor.check_stock("Peaches")
    assert_equal 0, @vendor.check_stock("Pizza")
  end

  def test_stock
    @vendor.stock("Peaches", 55)
    expected = {"Peaches"=>55}
    assert_equal expected, @vendor.inventory
  end

end
