class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :symbol
      t.string :company_name
      t.decimal :close
      t.decimal :open
      t.decimal :latest_price
      t.decimal :change
      t.decimal :change_percent

      t.timestamps
    end
  end
end
