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
    it "Returns an empty Array for items_ordered" do
      bill = RestaurantBill.new
      bill.ordered_items.must_be_kind_of Array
      bill.ordered_items.length.must_equal 0
    end
  end

  describe "Account#order_item" do
    it "Returns an array" do
      bill = RestaurantBill.new
      item = "steak"
      cost = 35
      with_1 = bill.order_item(item, cost)
      bill.ordered_items.must_be_kind_of Array
    end

    it "When run twice, there are 2 ordered items" do
      bill = RestaurantBill.new
      item1 = "steak"
      cost1 = 35
      item2 = "side salad"
      cost2 = 5
      with_1 = bill.order_item(item1, cost1)
      with_2 = bill.order_item(item2, cost2)
      expected_value = 2
      bill.ordered_items.length.must_equal expected_value
    end

    it "Returns three orders correctly" do
      bill = RestaurantBill.new
      item1 = "steak"
      cost1 = 35
      item2 = "side salad"
      cost2 = 5
      item3 = "dessert"
      cost3 = 9
      with_1 = bill.order_item(item1, cost1)
      with_2 = bill.order_item(item2, cost2)
      with_3 = bill.order_item(item3, cost3)
      expected = [["steak", 35], ["side salad", 5], ["dessert", 9]]
      all_ordered = bill.ordered_items
      all_ordered.must_equal expected
    end
  end
  describe "Account#total" do
    it "Returns the total plus tax" do
      bill = RestaurantBill.new
      cost1 = 35
      cost2 = 5
      bill.order_item("steak", cost1)
      bill.order_item("side salad", cost2)
      expected_total = cost1 + cost2
      expected_value = expected_total + expected_total*9.45/100
      bill.total.must_equal expected_value
    end
  end
  # describe "Account#tip" do
  #   it "Returns the total with a tip" do
  #   end
  # end
  # describe "Account#print" dordo
  #
  #   end
  #   it "Contains the bill, tax, and tip amounts" do
  #   end
  # end
end

# PARAMETERS:
# - A method that returns a total of all the item's costs combined, with tax
# - A method to add a tip. Returns total with tip.
# - A way to see the final cost of a bill, with tax and tip
# - The class should have the following attributes: ordered_items, tip and total
