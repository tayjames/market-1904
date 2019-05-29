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

end
