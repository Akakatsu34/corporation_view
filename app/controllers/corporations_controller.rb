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
      @corporation_results = @q.result #検索の結果を受け取る。
    end
    @count = 50
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
    @net_asset = Bs.find_by(security_code: @code).net_asset
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
    @q = Corporation.ransack(params[:q])
    @q.sorts = 'net_sale desc' if @q.sorts.empty?
  end

end
