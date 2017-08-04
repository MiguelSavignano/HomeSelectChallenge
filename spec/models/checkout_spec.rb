require 'rails_helper'

RSpec.describe Checkout, type: :model do
  let(:gr1) { create(:product, code: "GR1", name: "Green tea", price: 3.11 )}
  let(:sr1) { create(:product, code: "SR1", name: "Strawberries", price: 5 )}
  let(:cf1) { create(:product, code: "CF1", name: "Cofee", price: 11.23 )}

  it "#total" do
    co = Checkout.new
    co.scan(gr1)
    co.scan(sr1)
    co.scan(gr1)
    co.scan(gr1)
    co.scan(cf1)
    expect(co.total).to eq(22.45)
  end
  it "#total" do
    co = Checkout.new
    co.scan(gr1)
    co.scan(gr1)
    expect(co.total).to eq(3.11)
  end

  it "#scan" do
    co = Checkout.new
    co.scan(gr1)
    co.scan(sr1)
    co.scan(gr1)
    expect(co.products).to eq([gr1, sr1, gr1])
  end

  it ".calculate_discount_buy_one_get_one_free" do
    expect(PriceRules.calculate_discount_buy_one_get_one_free([gr1])).to eq(0)
    expect(PriceRules.calculate_discount_buy_one_get_one_free([gr1, gr1])).to eq(gr1.price)
    expect(PriceRules.calculate_discount_buy_one_get_one_free([gr1, gr1, gr1])).to eq(3.11)
    expect(PriceRules.calculate_discount_buy_one_get_one_free([gr1, gr1, gr1, gr1, gr1])).to eq(gr1.price + gr1.price)
  end
end
