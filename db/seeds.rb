require 'csv'

# CSV.foreach('db/corporation_data_2022.csv') do |corporation|
#   Corporation.create(
#     :security_code => corporation[0], 
#     :company_name => corporation[1],
#     :company_name_kana => corporation[2],
#     :company_name_en => corporation[3],
#     :security_name => corporation[4],
#     :address => corporation[5],
#     :consolidate => corporation[6],
#     :market => corporation[7],
#     :sector_thirty_three_number => corporation[8],
#     :sector_thirty_three_name => corporation[9],
#     :sector_seventeen_number => corporation[10],
#     :sector_seventeen_name => corporation[11],
#     :closing_date => corporation[12],
#     :asset => corporation[13],
#     :net_sale => corporation[14],
#   )
# end

CSV.foreach('db/BS_2021.csv') do |corporation|
  Bs.create(
    :security_code => corporation[0], 
    :year => corporation[1], 
    :asset => corporation[3],
    :net_asset => corporation[4],
    :shareholders_equity => corporation[5],
    :retained_earning => corporation[6],
    :current_liability => corporation[7],
    :noncurrent_liability => corporation[8],
  )
end

CSV.foreach('db/PL_2021.csv') do |corporation|
  Pl.create(
    :security_code => corporation[0], 
    :year => corporation[1], 
    :net_sale => corporation[3],
    :operating_income => corporation[4],
    :ordinary_income => corporation[5],
    :profit_loss => corporation[6],
  )
end

CSV.foreach('db/CF_2021.csv') do |corporation|
  Cf.create(
    :security_code => corporation[0], 
    :year => corporation[1], 
    :net_cash_provided_by_used_in_operating_activity => corporation[3],
    :net_cash_provided_by_used_in_investment_activity => corporation[4],
    :net_cash_provided_by_used_in_financing_activity => corporation[5],
  )
end