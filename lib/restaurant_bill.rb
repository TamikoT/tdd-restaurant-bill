class RestaurantBill
  attr_reader :ordered_items, :tip, :total

  TAX = 9.45
  def initialize
    @ordered_items = []
  end

  def order_item(item, cost)
    @ordered_items << [item, cost]
  end

  def total
    @total = 0
    @ordered_items.each do |array|
      @total += array[1]
    end
    @total += @total*TAX/100
    return @total
  end
end
