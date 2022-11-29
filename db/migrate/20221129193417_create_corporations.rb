class CreateCorporations < ActiveRecord::Migration[6.0]
  def change
    create_table :corporations do |t|
      t.integer :security_code
      t.string :company_name
      t.string :company_name_kana
      t.string :company_name_en
      t.string :security_name
      t.string :address
      t.string :consolidate
      t.string :market
      t.integer :sector_thirty_three_number
      t.string :sector_thirty_three_name
      t.integer :sector_seventeen_number
      t.string :sector_seventeen_name
      t.string :closing_date
      t.timestamps
    end
  end
end
