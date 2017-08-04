require 'rails_helper'

RSpec.describe Checkout, type: :model do
  let(:gr1) { create(:product, code: "GR1", name: "Green tea", price: 3.11 )}
  let(:sr1) { create(:product, code: "SR1", name: "Strawberries", price: 5 )}
  let(:cf1) { create(:product, code: "CF1", name: "Cofee", price: 11.23 )}

  it "total" do
    co = Checkout.new
    co.scan(gr1)
    co.scan(sr1)
    co.scan(gr1)
    co.scan(gr1)
    co.scan(cf1)
    expect(co.total).to eq(22.45)
  end
end
