module ApplicationHelper
	def get_symbol(asset_id)
      Asset.find(asset_id).symbol		
	end

	def get_name(asset_id)
      Asset.find(asset_id).company_name		
	end

	def get_price(asset_id)
      Asset.find(asset_id).latest_price		
	end
    
    def get_invest_value (asset_id)
       u = UserAsset.where(user_id: current_user.id, asset_id: asset_id).first
       u.invest_value if u.present?
    end

	def investment_become(invest_value , asset_id)
		invest_value += invest_value * Asset.find(asset_id).change_percent
    end
end
