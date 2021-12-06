class Asset < ApplicationRecord
	has_many :user_assets
  has_many :users, through: :user_assets

  def self.new_from_lookup(ticker_symbol)
    looked_up_asset = StockQuote::Stock.quote(ticker_symbol) if ticker_symbol.present?
    if looked_up_asset.present?
      new_asset = new(symbol: looked_up_asset.symbol, company_name: looked_up_asset.company_name)
      new_asset.latest_price = looked_up_asset.latest_price
      new_asset.close = looked_up_asset.close
      new_asset.open = looked_up_asset.open
      new_asset.change = looked_up_asset.change
      new_asset.change_percent = looked_up_asset.change_percent
      new_asset.save
      new_asset
    end 
  end
  
end
