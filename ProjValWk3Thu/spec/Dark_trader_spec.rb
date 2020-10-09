# Dark_trader_spec.rb

require_relative '../lib/Dark_trader'

describe "The Dark Trader function" do
  it "brings Currencies and Prices" do
    expect(Dark_Trader.key == "BTC").to eq("$10 897,90")
  end
end