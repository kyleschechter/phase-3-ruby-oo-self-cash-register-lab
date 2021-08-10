class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize discount = 0
    @total = 0
    @discount = discount
    @items = []
  end

  def apply_discount
    if self.discount > 0
      discounted = (100.0 - self.discount.to_f) / 100.0
      self.total = (self.total * discounted).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def add_item item, price, num_of_items = 1
    self.last_transaction = price * num_of_items
    self.total += self.last_transaction
    num_of_items.times { self.items << item }
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
