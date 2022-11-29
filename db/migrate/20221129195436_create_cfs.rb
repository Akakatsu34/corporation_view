class CreateCfs < ActiveRecord::Migration[6.0]
  def change
    create_table :cfs do |t|
      t.integer :security_code
      t.integer :year
      t.integer :net_cash_provided_by_used_in_operating_activity, :limit => 8
      t.integer :net_cash_provided_by_used_in_investment_activity, :limit => 8
      t.integer :net_cash_provided_by_used_in_financing_activity, :limit => 8
      t.timestamps
    end
  end
end
