class RestaurantBill
  attr_reader :ordered_items

  TAX = 9.45
  def initialize
    @ordered_items = []
  end

  def order_item(item, cost)
    @ordered_items << [item, cost]
  end
end
