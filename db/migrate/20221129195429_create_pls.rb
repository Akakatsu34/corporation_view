class CreatePls < ActiveRecord::Migration[6.0]
  def change
    create_table :pls do |t|
      t.integer :security_code
      t.integer :year
      t.integer :net_sale, :limit => 8
      t.integer :operating_income, :limit => 8
      t.integer :ordinary_income, :limit => 8
      t.integer :profit_loss, :limit => 8
      t.timestamps
    end
  end
end
