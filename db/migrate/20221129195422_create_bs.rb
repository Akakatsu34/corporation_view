class CreateBs < ActiveRecord::Migration[6.0]
  def change
    create_table :bs do |t|
      t.integer :security_code
      t.integer :year
      t.integer :asset, :limit => 8
      t.integer :net_asset, :limit => 8
      t.integer :shareholders_equity, :limit => 8
      t.integer :retained_earning, :limit => 8
      t.integer :current_liability, :limit => 8
      t.integer :noncurrent_liability, :limit => 8
      t.timestamps
    end
  end
end
