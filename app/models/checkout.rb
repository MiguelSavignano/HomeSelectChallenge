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
    discounts = calculate_discount(@products)
    total - discounts
  end

  def calculate_discount(products)
    0
  end
end
