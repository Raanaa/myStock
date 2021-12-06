class AddInvestValueToUserAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :user_assets, :invest_value, :float
  end
end
