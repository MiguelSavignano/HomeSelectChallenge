class Checkout < ApplicationRecord
  attr_accessor :products
  def initialize
    super
    @products = []
  end

  def scan(product)
    @products << product
  end
end
