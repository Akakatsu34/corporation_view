class CorporationsController < ApplicationController
  before_action :set_q, only: [:index, :show, :search]

  def index
    @corporations = Corporation.all
    @bs = Bs.all
    @pls = Pl.all
    @cfs = Cf.all
    @bs_asset_sum = Corporation.all.sum(:asset)
    @bs_net_asset_sum = Bs.all.sum(:net_asset)
    @corporation_data = Corporation.where(security_code: 1301)
  end

  def show
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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Corporation.ransack(params[:q])
    @q.sorts = 'net_sale desc' if @q.sorts.empty?
  end

end
