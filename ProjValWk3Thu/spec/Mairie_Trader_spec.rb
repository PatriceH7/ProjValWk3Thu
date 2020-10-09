# Mairie_Trader_spec.rb

require_relative '../lib/Mairie_Trader'

describe "The Mairie Trader function" do
  it "brings city hall names and emails together" do
    expect(Mairie_Trader.key == "").to eq("")
  end
end