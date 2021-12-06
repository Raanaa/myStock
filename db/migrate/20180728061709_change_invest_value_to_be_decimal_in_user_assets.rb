class ChangeInvestValueToBeDecimalInUserAssets < ActiveRecord::Migration[5.2]
  def change
  	change_column :user_assets, :invest_value, :decimal
  end
end
