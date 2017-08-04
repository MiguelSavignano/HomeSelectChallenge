require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:green_tea) { create(:product, code: "GR1", name: "Green tea", price: 3.11 )}
  let(:strawberries) { create(:product, code: "", name: "Strawberries", price: 5 )}
  let(:cofee) { create(:product, code: "", name: "Cofee", price: 11.23 )}

  it "#create" do
    expect(green_tea.price).to eq(3.11)
  end

end
