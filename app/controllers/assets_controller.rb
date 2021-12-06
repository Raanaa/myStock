class AssetsController < ApplicationController
  before_action :authenticate_user!

	def index
		@all_assets = Asset.all
	end

	def create
    if Asset.where(symbol: asset_params['symbol']).empty?
      asset = Asset.new_from_lookup(asset_params['symbol']) 
      asset.save if asset.present?
    end
  end

  def invest
   @invest_value = params[:invest_value]
    if @invest_value.present?
      user_asset = UserAsset.where(user_id: current_user.id , asset_id: params[:asset_id]).first
      if user_asset.present? # already invest in it"
        user_asset.invest_value = @invest_value
        user_asset.save
      else
        new_investment = UserAsset.new(:user_id => current_user.id , :asset_id => params[:asset_id] , :invest_value => @invest_value)
        new_investment.save
      end
      redirect_to :controller => 'assets', :action => 'my_assets'  
    else
      redirect_back fallback_location: root_path
    end
  end

  def my_assets
    @user_assets = UserAsset.where(:user_id => current_user.id)
  end

  def show
    @asset = Asset.find(params[:asset_id])
  end

  def update
    asset = Asset.find(params[:asset_id])
    asset.latest_price = StockQuote::Stock.quote(asset.symbol).latest_price
    asset.close = StockQuote::Stock.quote(asset.symbol).close
    asset.open = StockQuote::Stock.quote(asset.symbol).open
    asset.change = StockQuote::Stock.quote(asset.symbol).change
    asset.change_percent = StockQuote::Stock.quote(asset.symbol).change_percent
    asset.save
    redirect_back fallback_location: root_path
  end

private
    def asset_params
      params.require(:asset).permit(:symbol)
    end
end