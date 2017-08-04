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
    discounts = 0
    total = @products.map(&:price).reduce(&:+)
    discounts += PriceRules.calculate_discount_buy_one_get_one_free(@products)
    discounts += PriceRules.calculate_discount_3_or_more(@products)
    total - discounts
  end

end