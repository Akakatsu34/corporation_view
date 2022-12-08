class CorporationsController < ApplicationController
  before_action :set_q, only: [:index, :show, :search]

  def index
    if params[:q] != nil
      params[:q]['security_name_cont_any'] = params[:q]['security_name_cont_any'].split(/[\p{blank}\s]+/)
      @q = Corporation.ransack(params[:q])
      @q.sorts = 'net_sale desc' if @q.sorts.empty?
      @corporation_results = @q.result
    else
      @q = Corporation.ransack(params[:q])
      @q.sorts = 'net_sale desc' if @q.sorts.empty?
      @corporation_results = @q.result
    end
    
    @option = 'net_sale'
    @count = 50
    @year = 2021
    @model = Pl
    @colum = :net_sale
  end

  def index2
    @corporations = Corporation.all
    @bs = Bs.all
    @pls = Pl.all
    @cfs = Cf.all
    @bs_asset_sum = Corporation.all.sum(:asset)
    @bs_net_asset_sum = Bs.all.sum(:net_asset)
  end

  def show
    @code = Corporation.find(params[:id]).security_code
    @year = Bs.find_by(security_code: @code).year
    @market = Corporation.find_by(security_code: @code).market
    @sector_thirty_three_name = Corporation.find_by(security_code: @code).sector_thirty_three_name
    @closing_date = Corporation.find_by(security_code: @code).closing_date
    @address = Corporation.find_by(security_code: @code).address
    @corporation_name = Corporation.find_by(security_code: @code).security_name
    @asset = Bs.find_by(security_code: @code).asset
    @current_liability = Bs.find_by(security_code: @code).current_liability
    @noncurrent_liability = Bs.find_by(security_code: @code).noncurrent_liability
    @net_asset = Bs.find_by(security_code: @code).net_asset
    @shareholders_equity = Bs.find_by(security_code: @code).shareholders_equity
    @retained_earning = Bs.find_by(security_code: @code).retained_earning
    @net_sale = Pl.find_by(security_code: @code).net_sale
    @operating_income = Pl.find_by(security_code: @code).operating_income
    @ordinary_income = Pl.find_by(security_code: @code).ordinary_income
    @profit_loss = Pl.find_by(security_code: @code).profit_loss
    @operating = Cf.find_by(security_code: @code).net_cash_provided_by_used_in_operating_activity
    @investiment = Cf.find_by(security_code: @code).net_cash_provided_by_used_in_investment_activity
    @financing = Cf.find_by(security_code: @code).net_cash_provided_by_used_in_financing_activity
  end

  def search
    @results = @q.result
  end

  private

  def set_q
  end

end
