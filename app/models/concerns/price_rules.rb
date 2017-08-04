module PriceRules
  def self.calculate_discount_buy_one_get_one_free(_products, product_code_with_discount = "GR1")
    products = _products.select{|p| p.code == product_code_with_discount}
    products.shift if products.size % 2 != 0
    return 0 if products.empty?
    products.map(&:price).reduce(:+) / 2
  end

  def self.calculate_discount_3_or_more(_products, product_code_with_discount = "SR1")
    discount = 0.5
    products = _products.select{|p| p.code == product_code_with_discount}
    return 0 if products.empty? || products.size < 3
    discount * products.size
  end
end