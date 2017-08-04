class Checkout < ApplicationRecord
  attr_accessor :products
  def initialize
    super
    @products = []
  end

  def scan(product)
    @products << product
  end

  def total
    total = @products.map(&:price).reduce(&:+)
    discounts = PriceRules.calculate_discount_buy_one_get_one_free(@products)
    total - discounts
  end

end