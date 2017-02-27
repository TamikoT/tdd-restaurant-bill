require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/restaurant_bill'

describe "RestaurantBill class" do
  describe "Account#initialize" do
    it "Creates a new instance of Restaurant Bill class" do
      bill = RestaurantBill.new
      bill.must_be_kind_of RestaurantBill
    end
  end

  describe "Account#order_item" do
    it "Returns an array" do
      bill = RestaurantBill.new
      item = "steak"
      cost = 35
      ordered = bill.order_item(item, cost)
      ordered.must_be_kind_of Array
    end
  end
end
